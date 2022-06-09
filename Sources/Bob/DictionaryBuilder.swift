@resultBuilder
public struct DictionaryBuilder<Key: Hashable, Value> {
    public typealias Dictionary = Swift.Dictionary<Key, Value>
    public typealias Element = (Key, Value)

    public static func buildArray(_ dictionaries: [Dictionary]) -> Dictionary { dictionaries.reduce([:], +) }
    public static func buildBlock(_ dictionaries: Dictionary...) -> Dictionary { dictionaries.reduce([:], +) }
    public static func buildEither(first dictionary: Dictionary) -> Dictionary { dictionary }
    public static func buildEither(second dictionary: Dictionary) -> Dictionary { dictionary }
    public static func buildExpression(_ element: Element) -> Dictionary { [element.0: element.1] }
    public static func buildExpression(_ dictionary: Dictionary) -> Dictionary { dictionary }
    public static func buildLimitedAvailability(_ dictionary: Dictionary) -> Dictionary { dictionary }
    public static func buildOptional(_ dictionary: Dictionary?) -> Dictionary { dictionary ?? [:] }
}

extension Dictionary {
    public typealias Builder = DictionaryBuilder<Key, Value>

    @inlinable
    public static func build(@Builder _ build: () -> Self) -> Self {
        build()
    }
}

extension Dictionary {
    public static func + (lhs: Self, rhs: Self) -> Self {
        lhs.merging(rhs, uniquingKeysWith: { old, new in new })
    }
}
