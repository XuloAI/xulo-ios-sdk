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
            url: "https://github.com/XuloAI/xulo-ios-sdk/releases/download/0.1.6/Xulo.xcframework.zip",
            checksum: "2140698d07a46dda8c29028e266538f5a2fd3546a51ed8a1a2fd1f4cc31670ef"
        ),
        .binaryTarget(
            name: "XuloExtension",
            url: "https://github.com/XuloAI/xulo-ios-sdk/releases/download/0.1.6/XuloExtension.xcframework.zip",
            checksum: "56431eca3402c3cb4d9da9b07ef56a444129b547091ec96ba59274a76dbdecc8"
        ),
    ]
)
