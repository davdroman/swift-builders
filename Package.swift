// swift-tools-version: 5.7

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
            .product(name: "Benchmark", package: "swift-benchmark"),
            .target(name: "Builders"),
            .target(name: "BuildersTestSupport"),
        ]),
    ]
)

package.dependencies = [
    .package(url: "https://github.com/google/swift-benchmark", from: "0.1.2"),
]
