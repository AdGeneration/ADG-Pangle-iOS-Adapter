// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ADG-Pangle-iOS-Adapter",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "ADGPangleAdapter",
            type: .static,
            targets: ["ADGPangleAdapterTarget"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/AdGeneration/ADG-iOS-SDK.git",
            "2.43.0"..<"7.0.0"
        ),
        .package(
            url: "https://github.com/bytedance/AdsGlobalPackage",
            exact: "8.4.0-release.7"
        ),
    ],
    targets: [
        .target(
            name: "ADGPangleAdapterTarget",
            dependencies: [
                .target(name: "ADGPangleAdapter"),
                .product(name: "ADG", package: "ADG-iOS-SDK"),
                .product(name: "AdsGlobalPackage", package: "AdsGlobalPackage"),
            ],
            path: "ADGPangleAdapterTarget"
        ),
        .binaryTarget(
            name: "ADGPangleAdapter",
            url: "https://github.com/AdGeneration/ADG-Pangle-iOS-Adapter/releases/download/8.4.700/ADGPangle.xcframework.zip",
            checksum: "2ba56034d729854f0fd23681c7001568d0649a809a87f720516a57e124a1163c"
        ),
    ]
)
