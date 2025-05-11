@resultBuilder
public struct SubstringUnicodeScalarViewBuilder {
	@inlinable
	public static func buildBlock() -> Substring.UnicodeScalarView {
		Substring.UnicodeScalarView()
	}

	@inlinable
	public static func buildPartialBlock(first: Substring.UnicodeScalarView) -> Substring.UnicodeScalarView {
		first
	}

	@inlinable
	public static func buildPartialBlock(accumulated: Substring.UnicodeScalarView, next: Substring.UnicodeScalarView) -> Substring.UnicodeScalarView {
		accumulated + next
	}

	@inlinable
	public static func buildArray(_ components: [Substring.UnicodeScalarView]) -> Substring.UnicodeScalarView {
		Substring.UnicodeScalarView(components.joined())
	}

	@inlinable
	public static func buildEither(first component: Substring.UnicodeScalarView) -> Substring.UnicodeScalarView {
		component
	}

	@inlinable
	public static func buildEither(second component: Substring.UnicodeScalarView) -> Substring.UnicodeScalarView {
		component
	}

	@inlinable
	public static func buildExpression(_ element: Unicode.Scalar) -> Substring.UnicodeScalarView {
		Substring.UnicodeScalarView(CollectionOfOne(element))
	}

	@inlinable
	public static func buildExpression(_ component: Substring.UnicodeScalarView) -> Substring.UnicodeScalarView {
		component
	}

	@inlinable
	public static func buildLimitedAvailability(_ component: Substring.UnicodeScalarView) -> Substring.UnicodeScalarView {
		component
	}

	@inlinable
	public static func buildOptional(_ component: Substring.UnicodeScalarView?) -> Substring.UnicodeScalarView {
		component ?? Substring.UnicodeScalarView()
	}
}

extension Substring.UnicodeScalarView {
	@inlinable
	public static func build(@SubstringUnicodeScalarViewBuilder _ build: () -> Self) -> Self {
		build()
	}
}
