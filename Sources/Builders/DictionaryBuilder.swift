@resultBuilder
public struct DictionaryBuilder<Key: Hashable, Value> {
	@inlinable
	public static func buildBlock() -> [Key: Value] {
		[:]
	}

	@inlinable
	public static func buildPartialBlock(first: [Key: Value]) -> [Key: Value] {
		first
	}

	@inlinable
	public static func buildPartialBlock(accumulated: [Key: Value], next: [Key: Value]) -> [Key: Value] {
		accumulated.merging(next, uniquingKeysWith: { $1 })
	}

	@inlinable
	public static func buildArray(_ components: [[Key: Value]]) -> [Key: Value] {
		Dictionary(components.joined().map { ($0, $1) }, uniquingKeysWith: { $1 })
	}

	@inlinable
	public static func buildEither(first component: [Key: Value]) -> [Key: Value] {
		component
	}

	@inlinable
	public static func buildEither(second component: [Key: Value]) -> [Key: Value] {
		component
	}

	@inlinable
	public static func buildExpression(_ element: (Key, Value)) -> [Key: Value] {
		[element.0: element.1]
	}

	@inlinable
	public static func buildExpression(_ component: [Key: Value]) -> [Key: Value] {
		component
	}

	@inlinable
	public static func buildLimitedAvailability(_ component: [Key: Value]) -> [Key: Value] {
		component
	}

	@inlinable
	public static func buildOptional(_ component: [Key: Value]?) -> [Key: Value] {
		component ?? [:]
	}
}

extension Dictionary {
	@inlinable
	public static func build(@DictionaryBuilder<Key, Value> _ build: () -> Self) -> Self {
		build()
	}
}
