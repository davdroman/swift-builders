@resultBuilder
public struct SliceBuilder<Base: RangeReplaceableCollection> {
	@inlinable
	public static func buildBlock() -> Slice<Base> {
		Slice()
	}

	@inlinable
	public static func buildPartialBlock(first: Slice<Base>) -> Slice<Base> {
		first
	}

	@inlinable
	public static func buildPartialBlock(accumulated: Slice<Base>, next: Slice<Base>) -> Slice<Base> {
		accumulated + next
	}

	@inlinable
	public static func buildArray(_ components: [Slice<Base>]) -> Slice<Base> {
		Slice(components.joined())
	}

	@inlinable
	public static func buildEither(first component: Slice<Base>) -> Slice<Base> {
		component
	}

	@inlinable
	public static func buildEither(second component: Slice<Base>) -> Slice<Base> {
		component
	}

	@inlinable
	public static func buildExpression(_ element: Base.Element) -> Slice<Base> {
		Slice(CollectionOfOne(element))
	}

	@inlinable
	public static func buildExpression(_ element: Base) -> Slice<Base> {
		Slice(element)
	}

	@inlinable
	public static func buildExpression(_ component: Slice<Base>) -> Slice<Base> {
		component
	}

	@inlinable
	public static func buildLimitedAvailability(_ component: Slice<Base>) -> Slice<Base> {
		component
	}

	@inlinable
	public static func buildOptional(_ component: Slice<Base>?) -> Slice<Base> {
		component ?? Slice()
	}
}

extension Slice where Base: RangeReplaceableCollection {
	@inlinable
	public static func build(@SliceBuilder<Base> _ build: () -> Self) -> Self {
		build()
	}
}
