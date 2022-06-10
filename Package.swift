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
        .testTarget(name: "BobTests", dependencies: [
            .target(name: "Bob"),
            .target(name: "Utils"),
        ]),

        .executableTarget(name: "Benchmarks", dependencies: [
            .target(name: "Bob"),
            .product(name: "Benchmark", package: "swift-benchmark"),
            .target(name: "Utils"),
        ]),

        .target(name: "Utils"),
    ]
)

package.dependencies = [
    .package(url: "https://github.com/google/swift-benchmark", from: "0.1.2"),
]
