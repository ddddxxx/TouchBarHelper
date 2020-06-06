// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "TouchBarHelper",
    platforms: [
        .macOS(.v10_10),
    ],
    products: [
        .library(
            name: "TouchBarHelper",
            targets: ["TouchBarHelper"]),
    ],
    targets: [
        .target(
            name: "DFRPrivate",
            dependencies: []),
        .target(
            name: "TouchBarHelper",
            dependencies: ["DFRPrivate"]),
    ]
)
