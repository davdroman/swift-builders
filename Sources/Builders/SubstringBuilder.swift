@resultBuilder
public struct SubstringBuilder {
	@inlinable
	public static func buildBlock() -> Substring {
		Substring()
	}

	@inlinable
	public static func buildPartialBlock(first: Substring) -> Substring {
		first
	}

	@inlinable
	public static func buildPartialBlock(accumulated: Substring, next: Substring) -> Substring {
		accumulated + next
	}

	@inlinable
	public static func buildArray(_ components: [Substring]) -> Substring {
		Substring(components.joined())
	}

	@inlinable
	public static func buildEither(first component: Substring) -> Substring {
		component
	}

	@inlinable
	public static func buildEither(second component: Substring) -> Substring {
		component
	}

	@inlinable
	public static func buildExpression(_ element: Character) -> Substring {
		String(element)[...]
	}

	@inlinable
	public static func buildExpression(_ component: Substring) -> Substring {
		component
	}

	@inlinable
	public static func buildLimitedAvailability(_ component: Substring) -> Substring {
		component
	}

	@inlinable
	public static func buildOptional(_ component: Substring?) -> Substring {
		component ?? Substring()
	}
}

extension Substring {
	@inlinable
	public static func build(@SubstringBuilder _ build: () -> Self) -> Self {
		build()
	}
}
