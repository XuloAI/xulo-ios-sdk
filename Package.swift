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
            url: "https://github.com/XuloAI/xulo-ios-sdk/releases/download/0.1.0/Xulo.xcframework.zip",
            checksum: "d72ede4ca9c9f9e35cda7d7079aae56d789249ee37e500014ce0ae4b0969bfcd"
        ),
        .binaryTarget(
            name: "XuloExtension",
            url: "https://github.com/XuloAI/xulo-ios-sdk/releases/download/0.1.0/XuloExtension.xcframework.zip",
            checksum: "bfcc45bca416bf3c49d8c2939cfb75a2d40a219fde586e39532af15a5a068b3a"
        ),
    ]
)
