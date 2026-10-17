# Xulo

iOS push, and the native in-app card that belongs in the app. The package downloads a closed binary. It does not compile the SDK source.

Create an app at [xulo.io](https://xulo.io) and copy its API key. The SDK calls `https://api.xulo.io`. You do not pass a server address.

## Requirements

- Xcode 16 or later
- iOS 15 or later
- A physical iPhone for a real push. The simulator can call the API. It does not receive remote notifications.

## Install

In Xcode, choose File → Add Package Dependencies and enter:

```
https://github.com/XuloAI/xulo-ios-sdk
```

Use version 0.1.0, up to the next major version.

Add the products to these targets:

| Product | Target |
| --- | --- |
| `Xulo` | The app |
| `XuloExtension` | Notification Service and Notification Content |

Do not add `Xulo` to either extension.

## App setup

Turn on the Push Notifications capability for the app.

Create one App Group and add it to the app and both extensions. On each of those three targets, set the Info.plist key `XuloAppGroup` to that group id.

```swift
import Xulo

Xulo.logLevel = .verbose
Xulo.start(apiKey: "YOUR_API_KEY")
```

`start` reads the app’s bundle id and calls `https://api.xulo.io`. Pass `bundleId` only when that id is not the one registered in the panel.

`logLevel` is `.off` unless you set it. `.verbose` prints the trace in Xcode. `.error` prints failures only. A live build leaves it off. The log never includes the API key or the device token. The extension reads the same level from the app group after `start`.

## Push

Ask for permission, then pass Apple’s token through. Forward the tap as well.

```swift
Xulo.requestPushPermission()
```

```swift
func application(
    _ application: UIApplication,
    didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
) {
    Xulo.setDeviceToken(deviceToken)
}

func application(
    _ application: UIApplication,
    didFailToRegisterForRemoteNotificationsWithError error: Error
) {
    Xulo.didFailToRegister()
}

func userNotificationCenter(
    _ center: UNUserNotificationCenter,
    didReceive response: UNNotificationResponse
) async {
    Xulo.didReceive(userInfo: response.notification.request.content.userInfo)
}
```

`Xulo.subscriptionId` is this install. It stays the same when the token refreshes and when the person logs out.

To handle a link yourself, set `Xulo.onOpen`. Return `true` when the app opened it.

## Images and the long-press card

Text push works with the app target alone. An image, and the long-press card, need both extensions. If the image download fails, the text still arrives.

Notification Service, principal class is your subclass:

```swift
import XuloExtension

final class NotificationService: XuloNotificationService {}
```

Notification Content, principal class is your subclass:

```swift
import XuloExtension

final class NotificationViewController: XuloNotificationViewController {}
```

On the content extension, set `UNNotificationExtensionCategory` to `xulo`. That is the category the payload uses.

Each extension’s bundle id is the app id plus a suffix. Example: `app.example.ios.NotificationService`.

## People, tags, and purchases

```swift
await Xulo.login(externalId: "USER_ID")
Xulo.setTags(["plan": "pro"])
await Xulo.purchase(amount: 1500, currency: "USD", orderId: "ORDER_ID")
await Xulo.logout()
```

`login` takes the id your app already uses, as text. A blank value does not log the device out. `setTags` writes tags on the current person. `logout` keeps the subscription id and the push token, and starts a new anonymous person.

`amount` is in minor units. `1500` with `USD` is $15.00. Sending the same order id again replaces that order. A refund is the same order id with the amount that remains.

## In-app

The SDK asks for a card when the app becomes active. Call a named card yourself:

```swift
Xulo.call("checkout")
```

The card in the panel has to be approved, and its trigger has to match that name. A card with no trigger never matches.

## Version

`Xulo.sdkVersion` is `"0.1.0"`.
