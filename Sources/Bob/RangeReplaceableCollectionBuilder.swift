@resultBuilder
public struct RangeReplaceableCollectionBuilder<Collection: RangeReplaceableCollection> {
    public typealias Element = Collection.Element

    #if compiler(>=5.7)
    @inlinable
    public static func buildPartialBlock(first: Collection) -> Collection {
        first
    }

    @inlinable
    public static func buildPartialBlock(accumulated: Collection, next: Collection) -> Collection {
        accumulated + next
    }
    #else
    @inlinable
    public static func buildBlock(_ components: Collection...) -> Collection {
        components.reduce(Collection(), +)
    }
    #endif

    @inlinable
    public static func buildArray(_ components: [Collection]) -> Collection {
        components.reduce(Collection(), +)
    }

    @inlinable
    public static func buildEither(first component: Collection) -> Collection {
        component
    }

    @inlinable
    public static func buildEither(second component: Collection) -> Collection {
        component
    }

    @inlinable
    public static func buildExpression(_ element: Element) -> Collection {
        Collection(repeating: element, count: 1)
    }

    @inlinable
    public static func buildExpression(_ component: Collection) -> Collection {
        component
    }

    @inlinable
    public static func buildLimitedAvailability(_ component: Collection) -> Collection {
        component
    }

    @inlinable
    public static func buildOptional(_ component: Collection?) -> Collection {
        component ?? Collection()
    }
}

extension RangeReplaceableCollection {
    public typealias Builder = RangeReplaceableCollectionBuilder<Self>

    @inlinable
    public static func build(@Builder _ build: () -> Self) -> Self {
        build()
    }
}
