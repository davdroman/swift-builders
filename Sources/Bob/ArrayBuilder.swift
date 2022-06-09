@resultBuilder
public struct ArrayBuilder<Element> {
    public typealias Array = Swift.Array<Element>

    #if compiler(>=5.7)
    public static func buildPartialBlock(first: Array) -> Array {
        first
    }

    public static func buildPartialBlock(accumulated: Array, next: Array) -> Array {
        accumulated + next
    }
    #else
    public static func buildBlock(_ arrays: Array...) -> Array {
        arrays.reduce([], +)
    }
    #endif

    public static func buildArray(_ arrays: [Array]) -> Array {
        arrays.reduce([], +)
    }

    public static func buildEither(first array: Array) -> Array {
        array
    }

    public static func buildEither(second array: Array) -> Array {
        array
    }

    public static func buildExpression(_ element: Element) -> Array {
        [element]
    }

    public static func buildExpression(_ array: Array) -> Array {
        array
    }

    public static func buildLimitedAvailability(_ array: Array) -> Array {
        array
    }

    public static func buildOptional(_ array: Array?) -> Array {
        array ?? []
    }
}

extension Array {
    public typealias Builder = ArrayBuilder<Element>

    @inlinable
    public static func build(@Builder _ build: () -> Self) -> Self {
        build()
    }
}
