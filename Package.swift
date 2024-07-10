// swift-tools-version: 5.9

import PackageDescription

let package = Package(
	name: "swift-builders",
	platforms: [
		.iOS(.v12),
		.macOS(.v10_15),
		.tvOS(.v12),
		.watchOS(.v4),
	],
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
