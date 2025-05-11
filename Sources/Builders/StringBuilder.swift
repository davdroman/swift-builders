@resultBuilder
public struct StringBuilder {
	@inlinable
	public static func buildBlock() -> String {
		String()
	}

	@inlinable
	public static func buildPartialBlock(first: String) -> String {
		first
	}

	@inlinable
	public static func buildPartialBlock(accumulated: String, next: String) -> String {
		accumulated + next
	}

	@inlinable
	public static func buildArray(_ components: [String]) -> String {
		String(components.joined())
	}

	@inlinable
	public static func buildEither(first component: String) -> String {
		component
	}

	@inlinable
	public static func buildEither(second component: String) -> String {
		component
	}

	@inlinable
	public static func buildExpression(_ element: Character) -> String {
		String(element)
	}

	@inlinable
	public static func buildExpression(_ component: String) -> String {
		component
	}

	@inlinable
	public static func buildLimitedAvailability(_ component: String) -> String {
		component
	}

	@inlinable
	public static func buildOptional(_ component: String?) -> String {
		component ?? String()
	}
}

extension String {
	@inlinable
	public static func build(@StringBuilder _ build: () -> Self) -> Self {
		build()
	}
}
