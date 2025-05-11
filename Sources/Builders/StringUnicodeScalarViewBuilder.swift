@resultBuilder
public struct StringUnicodeScalarViewBuilder {
	@inlinable
	public static func buildBlock() -> String.UnicodeScalarView {
		String.UnicodeScalarView()
	}

	@inlinable
	public static func buildPartialBlock(first: String.UnicodeScalarView) -> String.UnicodeScalarView {
		first
	}

	@inlinable
	public static func buildPartialBlock(accumulated: String.UnicodeScalarView, next: String.UnicodeScalarView) -> String.UnicodeScalarView {
		accumulated + next
	}

	@inlinable
	public static func buildArray(_ components: [String.UnicodeScalarView]) -> String.UnicodeScalarView {
		String.UnicodeScalarView(components.joined())
	}

	@inlinable
	public static func buildEither(first component: String.UnicodeScalarView) -> String.UnicodeScalarView {
		component
	}

	@inlinable
	public static func buildEither(second component: String.UnicodeScalarView) -> String.UnicodeScalarView {
		component
	}

	@inlinable
	public static func buildExpression(_ element: Unicode.Scalar) -> String.UnicodeScalarView {
		String.UnicodeScalarView(CollectionOfOne(element))
	}

	@inlinable
	public static func buildExpression(_ component: String.UnicodeScalarView) -> String.UnicodeScalarView {
		component
	}

	@inlinable
	public static func buildLimitedAvailability(_ component: String.UnicodeScalarView) -> String.UnicodeScalarView {
		component
	}

	@inlinable
	public static func buildOptional(_ component: String.UnicodeScalarView?) -> String.UnicodeScalarView {
		component ?? String.UnicodeScalarView()
	}
}

extension String.UnicodeScalarView {
	@inlinable
	public static func build(@StringUnicodeScalarViewBuilder _ build: () -> Self) -> Self {
		build()
	}
}
