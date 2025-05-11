@resultBuilder
public struct ContiguousArrayBuilder<Element> {
	@inlinable
	public static func buildBlock() -> ContiguousArray<Element> {
		[]
	}

	@inlinable
	public static func buildPartialBlock(first: ContiguousArray<Element>) -> ContiguousArray<Element> {
		first
	}

	@inlinable
	public static func buildPartialBlock(accumulated: ContiguousArray<Element>, next: ContiguousArray<Element>) -> ContiguousArray<Element> {
		accumulated + next
	}

	@inlinable
	public static func buildArray(_ components: [ContiguousArray<Element>]) -> ContiguousArray<Element> {
		ContiguousArray(components.joined())
	}

	@inlinable
	public static func buildEither(first component: ContiguousArray<Element>) -> ContiguousArray<Element> {
		component
	}

	@inlinable
	public static func buildEither(second component: ContiguousArray<Element>) -> ContiguousArray<Element> {
		component
	}

	@inlinable
	public static func buildExpression(_ element: Element) -> ContiguousArray<Element> {
		[element]
	}

	@inlinable
	public static func buildExpression(_ component: ContiguousArray<Element>) -> ContiguousArray<Element> {
		component
	}

	@inlinable
	public static func buildLimitedAvailability(_ component: ContiguousArray<Element>) -> ContiguousArray<Element> {
		component
	}

	@inlinable
	public static func buildOptional(_ component: ContiguousArray<Element>?) -> ContiguousArray<Element> {
		component ?? []
	}
}

extension ContiguousArray {
	@inlinable
	public static func build(@ContiguousArrayBuilder<Element> _ build: () -> Self) -> Self {
		build()
	}
}
