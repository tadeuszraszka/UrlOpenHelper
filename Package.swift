// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UrlOpenHelper",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "UrlOpenHelper",
            targets: ["UrlOpenHelper"]),
    ],
    targets: [
        .target(
            name: "UrlOpenHelper",
            dependencies: []),
        .testTarget(
            name: "UrlOpenHelperTests",
            dependencies: ["UrlOpenHelper"]),
    ]
)
