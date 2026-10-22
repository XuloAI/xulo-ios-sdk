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
            url: "https://github.com/XuloAI/xulo-ios-sdk/releases/download/0.1.5/Xulo.xcframework.zip",
            checksum: "f20c4a549adf95f11c4a89f05d7268188064aee1a491bae7b321ff8543fc658a"
        ),
        .binaryTarget(
            name: "XuloExtension",
            url: "https://github.com/XuloAI/xulo-ios-sdk/releases/download/0.1.5/XuloExtension.xcframework.zip",
            checksum: "8482754d963e0112ec8157287dd09a48560ff127af665b4c45c39bd07de56375"
        ),
    ]
)
