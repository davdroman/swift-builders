// swift-tools-version: 5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-builders",
    products: [
        .library(name: "Builders", targets: ["Builders"]),
    ],
    targets: [
        .target(name: "Builders"),
        .testTarget(name: "BuildersTests", dependencies: [
            .target(name: "Builders"),
            .target(name: "Utils"),
        ]),

        .executableTarget(name: "Benchmarks", dependencies: [
            .target(name: "Builders"),
            .product(name: "Benchmark", package: "Benchmark"),
            .target(name: "Utils"),
        ]),

        .target(name: "Utils"),
    ]
)

package.dependencies = [
    .package(name: "Benchmark", url: "https://github.com/google/swift-benchmark", from: "0.1.2"),
]
