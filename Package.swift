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
            url: "https://github.com/XuloAI/xulo-ios-sdk/releases/download/0.1.3/Xulo.xcframework.zip",
            checksum: "ccd897e05c55675f0d460ece9ad07cf0bf2a162d8af14e73848990e741150bdc"
        ),
        .binaryTarget(
            name: "XuloExtension",
            url: "https://github.com/XuloAI/xulo-ios-sdk/releases/download/0.1.3/XuloExtension.xcframework.zip",
            checksum: "ea95b88aff4d52852560dc5f67d15030c64efbee01b1ddbfb7ad719a99caa858"
        ),
    ]
)
