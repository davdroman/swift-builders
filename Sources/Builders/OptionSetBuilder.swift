@resultBuilder
public struct OptionSetBuilder<Element: OptionSet> {
	@inlinable
	public static func buildBlock() -> Element {
		[]
	}

	@inlinable
	public static func buildPartialBlock(first: Element) -> Element {
		first
	}

	@inlinable
	public static func buildPartialBlock(accumulated: Element, next: Element) -> Element {
		accumulated.union(next)
	}

	@inlinable
	public static func buildArray(_ components: [Element]) -> Element {
		components.reduce(into: []) { $0.formUnion($1) }
	}

	@inlinable
	public static func buildEither(first component: Element) -> Element {
		component
	}

	@inlinable
	public static func buildEither(second component: Element) -> Element {
		component
	}

	@inlinable
	public static func buildExpression(_ element: Element) -> Element {
		element
	}

	public static func buildLimitedAvailability(_ element: Element) -> Element {
		element
	}

	public static func buildOptional(_ element: Element?) -> Element {
		element ?? []
	}
}

extension OptionSet {
	@inlinable
	public static func build(@OptionSetBuilder<Self> _ build: () -> Self) -> Self {
		build()
	}
}
