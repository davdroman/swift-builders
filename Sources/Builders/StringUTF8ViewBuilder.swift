@resultBuilder
public struct StringUTF8ViewViewBuilder {
	@inlinable
	public static func buildBlock() -> String.UTF8View {
		String().utf8
	}

	@inlinable
	public static func buildPartialBlock(first: String.UTF8View) -> String.UTF8View {
		first
	}

	@inlinable
	public static func buildPartialBlock(accumulated: String.UTF8View, next: String.UTF8View) -> String.UTF8View {
		(String(accumulated) + String(next)).utf8
	}

	@inlinable
	public static func buildArray(_ components: [String.UTF8View]) -> String.UTF8View {
		String(decoding: components.joined(), as: UTF8.self).utf8
	}

	@inlinable
	public static func buildEither(first component: String.UTF8View) -> String.UTF8View {
		component
	}

	@inlinable
	public static func buildEither(second component: String.UTF8View) -> String.UTF8View {
		component
	}

	@inlinable
	public static func buildExpression(_ element: UTF8.CodeUnit) -> String.UTF8View {
		String(decoding: CollectionOfOne(element), as: UTF8.self).utf8
	}

	@inlinable
	public static func buildExpression(_ component: String.UTF8View) -> String.UTF8View {
		component
	}

	@inlinable
	public static func buildLimitedAvailability(_ component: String.UTF8View) -> String.UTF8View {
		component
	}

	@inlinable
	public static func buildOptional(_ component: String.UTF8View?) -> String.UTF8View {
		component ?? String().utf8
	}
}

extension String.UTF8View {
	@inlinable
	public static func build(@StringUTF8ViewViewBuilder _ build: () -> Self) -> Self {
		build()
	}
}
