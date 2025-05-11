@resultBuilder
public struct ArraySliceBuilder<Element> {
	@inlinable
	public static func buildBlock() -> ArraySlice<Element> {
		[]
	}

	@inlinable
	public static func buildPartialBlock(first: ArraySlice<Element>) -> ArraySlice<Element> {
		first
	}

	@inlinable
	public static func buildPartialBlock(accumulated: ArraySlice<Element>, next: ArraySlice<Element>) -> ArraySlice<Element> {
		accumulated + next
	}

	@inlinable
	public static func buildArray(_ components: [ArraySlice<Element>]) -> ArraySlice<Element> {
		ArraySlice(components.joined())
	}

	@inlinable
	public static func buildEither(first component: ArraySlice<Element>) -> ArraySlice<Element> {
		component
	}

	@inlinable
	public static func buildEither(second component: ArraySlice<Element>) -> ArraySlice<Element> {
		component
	}

	@inlinable
	public static func buildExpression(_ element: Element) -> ArraySlice<Element> {
		[element]
	}

	@inlinable
	public static func buildExpression(_ component: ArraySlice<Element>) -> ArraySlice<Element> {
		component
	}

	@inlinable
	public static func buildLimitedAvailability(_ component: ArraySlice<Element>) -> ArraySlice<Element> {
		component
	}

	@inlinable
	public static func buildOptional(_ component: ArraySlice<Element>?) -> ArraySlice<Element> {
		component ?? []
	}
}

extension ArraySlice {
	@inlinable
	public static func build(@ArraySliceBuilder<Element> _ build: () -> Self) -> Self {
		build()
	}
}
