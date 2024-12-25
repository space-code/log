// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Log",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .watchOS(.v7),
        .tvOS(.v13),
        .visionOS(.v1),
    ],
    products: [
        .library(name: "Log", targets: ["Log"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "Log", dependencies: []),
        .testTarget(name: "LogTests", dependencies: ["Log"]),
    ]
)
