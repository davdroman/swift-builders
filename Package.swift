// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Bob",
    products: [
        .library(name: "Bob", targets: ["Bob"]),
    ],
    targets: [
        .target(name: "Bob"),
        .testTarget(name: "BobTests", dependencies: ["Bob"]),
    ]
)
