@resultBuilder
public struct DictionaryBuilder<Key: Hashable, Value> {
	@inlinable
	public static func buildBlock() -> Dictionary<Key, Value> {
		[:]
	}

	@inlinable
	public static func buildPartialBlock(first: Dictionary<Key, Value>) -> Dictionary<Key, Value> {
		first
	}

	@inlinable
	public static func buildPartialBlock(accumulated: Dictionary<Key, Value>, next: Dictionary<Key, Value>) -> Dictionary<Key, Value> {
		accumulated.merging(next, uniquingKeysWith: { $1 })
	}

	@inlinable
	public static func buildArray(_ components: [Dictionary<Key, Value>]) -> Dictionary<Key, Value> {
		Dictionary(components.joined().map { ($0, $1) }, uniquingKeysWith: { $1 })
	}

	@inlinable
	public static func buildEither(first component: Dictionary<Key, Value>) -> Dictionary<Key, Value> {
		component
	}

	@inlinable
	public static func buildEither(second component: Dictionary<Key, Value>) -> Dictionary<Key, Value> {
		component
	}

	@inlinable
	public static func buildExpression(_ element: (Key, Value)) -> Dictionary<Key, Value> {
		[element.0: element.1]
	}

	@inlinable
	public static func buildExpression(_ component: Dictionary<Key, Value>) -> Dictionary<Key, Value> {
		component
	}

	@inlinable
	public static func buildLimitedAvailability(_ component: Dictionary<Key, Value>) -> Dictionary<Key, Value> {
		component
	}

	@inlinable
	public static func buildOptional(_ component: Dictionary<Key, Value>?) -> Dictionary<Key, Value> {
		component ?? [:]
	}
}

extension Dictionary {
	@inlinable
	public static func build(@DictionaryBuilder<Key, Value> _ build: () -> Self) -> Self {
		build()
	}
}
