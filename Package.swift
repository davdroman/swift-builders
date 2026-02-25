// swift-tools-version: 6.1

import PackageDescription

let package = Package(
	name: "swift-builders",
	platforms: [
		.iOS(.v13),
		.macCatalyst(.v13),
		.macOS(.v10_15),
		.tvOS(.v13),
		.visionOS(.v1),
		.watchOS(.v6),
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
	],
)

package.dependencies += [
	.package(url: "https://github.com/google/swift-benchmark", from: "0.1.2"),
]

for target in package.targets {
	target.swiftSettings = target.swiftSettings ?? []
	target.swiftSettings? += [
		.enableUpcomingFeature("ExistentialAny"),
		.enableUpcomingFeature("InternalImportsByDefault"),
		.enableUpcomingFeature("MemberImportVisibility"),
	]
}
