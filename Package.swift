// swift-tools-version: 6.0

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
	],
	targets: [
		.target(name: "Builders"),
		.testTarget(name: "BuildersTests", dependencies: [
			.target(name: "Builders"),
		]),

		.executableTarget(name: "Benchmarks", dependencies: [
			.product(name: "Benchmark", package: "swift-benchmark"),
			.target(name: "Builders"),
		]),
	]
)

package.dependencies = [
	.package(url: "https://github.com/google/swift-benchmark", from: "0.1.2"),
]

for target in package.targets {
	target.swiftSettings = target.swiftSettings ?? []
	target.swiftSettings? += [
		.enableUpcomingFeature("ExistentialAny"),
		.enableUpcomingFeature("InternalImportsByDefault"),
	]
}
