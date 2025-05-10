@resultBuilder
public struct ArrayBuilder<Element> {
	@inlinable
	public static func buildBlock() -> [Element] {
		[]
	}

	@inlinable
	public static func buildPartialBlock(first: [Element]) -> [Element] {
		first
	}

	@inlinable
	public static func buildPartialBlock(accumulated: [Element], next: [Element]) -> [Element] {
		accumulated + next
	}

	@inlinable
	public static func buildArray(_ components: [[Element]]) -> [Element] {
		Array(components.joined())
	}

	@inlinable
	public static func buildEither(first component: [Element]) -> [Element] {
		component
	}

	@inlinable
	public static func buildEither(second component: [Element]) -> [Element] {
		component
	}

	@inlinable
	public static func buildExpression(_ element: Element) -> [Element] {
		[element]
	}

	@inlinable
	public static func buildExpression(_ component: [Element]) -> [Element] {
		component
	}

	@inlinable
	public static func buildLimitedAvailability(_ component: [Element]) -> [Element] {
		component
	}

	@inlinable
	public static func buildOptional(_ component: [Element]?) -> [Element] {
		component ?? []
	}
}

extension Array {
	@inlinable
	public static func build(@ArrayBuilder<Element> _ build: () -> Self) -> Self {
		build()
	}
}
