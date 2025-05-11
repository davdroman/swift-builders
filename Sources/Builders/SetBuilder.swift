@resultBuilder
public struct SetBuilder<Element: Hashable> {
	@inlinable
	public static func buildBlock() -> Set<Element> {
		[]
	}

	@inlinable
	public static func buildPartialBlock(first: Set<Element>) -> Set<Element> {
		first
	}

	@inlinable
	public static func buildPartialBlock(accumulated: Set<Element>, next: Set<Element>) -> Set<Element> {
		accumulated.union(next)
	}

	@inlinable
	public static func buildArray(_ components: [Set<Element>]) -> Set<Element> {
		Set(components.joined())
	}

	@inlinable
	public static func buildEither(first component: Set<Element>) -> Set<Element> {
		component
	}

	@inlinable
	public static func buildEither(second component: Set<Element>) -> Set<Element> {
		component
	}

	@inlinable
	public static func buildExpression(_ element: Element) -> Set<Element> {
		[element]
	}

	@inlinable
	public static func buildExpression(_ component: Set<Element>) -> Set<Element> {
		component
	}

	@inlinable
	public static func buildLimitedAvailability(_ component: Set<Element>) -> Set<Element> {
		component
	}

	@inlinable
	public static func buildOptional(_ component: Set<Element>?) -> Set<Element> {
		component ?? []
	}
}

extension Set {
	@inlinable
	public static func build(@SetBuilder<Element> _ build: () -> Self) -> Self {
		build()
	}
}
