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
            url: "https://github.com/XuloAI/xulo-ios-sdk/releases/download/0.1.4/Xulo.xcframework.zip",
            checksum: "cd56636f138446482a13895be3a5d29cf564081c5f8d42cb70cb33a72723581e"
        ),
        .binaryTarget(
            name: "XuloExtension",
            url: "https://github.com/XuloAI/xulo-ios-sdk/releases/download/0.1.4/XuloExtension.xcframework.zip",
            checksum: "cf663264f58df73c8ea60fe5647c8bff997ceae3e35f9119e2737d5709ad54f0"
        ),
    ]
)
