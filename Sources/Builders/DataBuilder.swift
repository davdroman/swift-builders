#if canImport(Foundation)
public import Foundation

@resultBuilder
public struct DataBuilder {
	@inlinable
	public static func buildBlock() -> Data {
		Data()
	}

	@inlinable
	public static func buildPartialBlock(first: Data) -> Data {
		first
	}

	@inlinable
	public static func buildPartialBlock(accumulated: Data, next: Data) -> Data {
		accumulated + next
	}

	@inlinable
	public static func buildArray(_ components: [Data]) -> Data {
		Data(components.joined())
	}

	@inlinable
	public static func buildEither(first component: Data) -> Data {
		component
	}

	@inlinable
	public static func buildEither(second component: Data) -> Data {
		component
	}

	@inlinable
	public static func buildExpression(_ element: Data.Element) -> Data {
		Data(CollectionOfOne(element))
	}

	@inlinable
	public static func buildExpression(_ component: Data) -> Data {
		component
	}

	@inlinable
	public static func buildLimitedAvailability(_ component: Data) -> Data {
		component
	}

	@inlinable
	public static func buildOptional(_ component: Data?) -> Data {
		component ?? Data()
	}
}

extension Data {
	@inlinable
	public static func build(@DataBuilder _ build: () -> Self) -> Self {
		build()
	}
}
#endif
