// swift-tools-version: 5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-builders",
    products: [
        .library(name: "Builders", targets: ["Builders"]),
        .library(name: "BuildersTestSupport", targets: ["BuildersTestSupport"]),
    ],
    targets: [
        .target(name: "Builders"),
        .testTarget(name: "BuildersTests", dependencies: [
            .target(name: "Builders"),
            .target(name: "BuildersTestSupport"),
        ]),

        .target(name: "BuildersTestSupport"),

        .executableTarget(name: "Benchmarks", dependencies: [
            .product(name: "Benchmark", package: "Benchmark"),
            .target(name: "Builders"),
            .target(name: "BuildersTestSupport"),
        ]),
    ]
)

package.dependencies = [
    .package(name: "Benchmark", url: "https://github.com/google/swift-benchmark", from: "0.1.2"),
]
