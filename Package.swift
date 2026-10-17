// swift-tools-version: 5.9
import PackageDescription

// Closed binaries only. The Swift source stays in the private xulo-ios repository.
// Replace the checksums after Scripts/build-xcframework.sh publishes the zip files.
let package = Package(
    name: "Xulo",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "Xulo", targets: ["Xulo"]),
        .library(name: "XuloExtension", targets: ["XuloExtension"]),
    ],
    targets: [
        .binaryTarget(
            name: "Xulo",
            url: "https://github.com/XuloAI/xulo-ios-sdk/releases/download/0.1.1/Xulo.xcframework.zip",
            checksum: "c34c9c6c967e4ab6a8eed40e7df4cecdde4242526a0a405b44b2e982a348fc67"
        ),
        .binaryTarget(
            name: "XuloExtension",
            url: "https://github.com/XuloAI/xulo-ios-sdk/releases/download/0.1.1/XuloExtension.xcframework.zip",
            checksum: "749ff24c079e09ca4d8e1f3f7dffd959b0ec1a9ff8e4aae62f525b2549708ea8"
        ),
    ]
)
