@resultBuilder
public struct SubstringUTF8ViewViewBuilder {
	@inlinable
	public static func buildBlock() -> Substring.UTF8View {
		Substring().utf8
	}

	@inlinable
	public static func buildPartialBlock(first: Substring.UTF8View) -> Substring.UTF8View {
		first
	}

	@inlinable
	public static func buildPartialBlock(accumulated: Substring.UTF8View, next: Substring.UTF8View) -> Substring.UTF8View {
		(Substring(accumulated) + Substring(next)).utf8
	}

	@inlinable
	public static func buildArray(_ components: [Substring.UTF8View]) -> Substring.UTF8View {
		Substring(decoding: components.joined(), as: UTF8.self).utf8
	}

	@inlinable
	public static func buildEither(first component: Substring.UTF8View) -> Substring.UTF8View {
		component
	}

	@inlinable
	public static func buildEither(second component: Substring.UTF8View) -> Substring.UTF8View {
		component
	}

	@inlinable
	public static func buildExpression(_ element: UTF8.CodeUnit) -> Substring.UTF8View {
		Substring(decoding: CollectionOfOne(element), as: UTF8.self).utf8
	}

	@inlinable
	public static func buildExpression(_ component: Substring.UTF8View) -> Substring.UTF8View {
		component
	}

	@inlinable
	public static func buildLimitedAvailability(_ component: Substring.UTF8View) -> Substring.UTF8View {
		component
	}

	@inlinable
	public static func buildOptional(_ component: Substring.UTF8View?) -> Substring.UTF8View {
		component ?? Substring().utf8
	}
}

extension Substring.UTF8View {
	@inlinable
	public static func build(@SubstringUTF8ViewViewBuilder _ build: () -> Self) -> Self {
		build()
	}
}
