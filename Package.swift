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
            url: "https://github.com/XuloAI/xulo-ios-sdk/releases/download/0.1.2/Xulo.xcframework.zip",
            checksum: "2871b810fb97bccaf8209a1f1b6fb9e76f13305a68c2aee57487372bdd7f1037"
        ),
        .binaryTarget(
            name: "XuloExtension",
            url: "https://github.com/XuloAI/xulo-ios-sdk/releases/download/0.1.2/XuloExtension.xcframework.zip",
            checksum: "ab0631e07dc86fbbec9ff7cf385ba18d18fbb4d341a7285b7615b7fdddd22128"
        ),
    ]
)
