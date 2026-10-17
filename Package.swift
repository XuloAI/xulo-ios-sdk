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
            checksum: "a3bbe72e3c78bc1f2af8b98b1242c4ec679304a6fd58a12e5076d46c262004b3"
        ),
        .binaryTarget(
            name: "XuloExtension",
            url: "https://github.com/XuloAI/xulo-ios-sdk/releases/download/0.1.0/XuloExtension.xcframework.zip",
            checksum: "b61e911eff84e813c5ea61eb9b251584cd397975a65a1e7d6c219c2edeea9be9"
        ),
    ]
)
