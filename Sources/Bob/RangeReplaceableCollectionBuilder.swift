@resultBuilder
public struct RangeReplaceableCollectionBuilder<Collection: RangeReplaceableCollection> {
    public typealias Element = Collection.Element

    #if compiler(>=5.7)
    public static func buildPartialBlock(first: Collection) -> Collection {
        first
    }

    public static func buildPartialBlock(accumulated: Collection, next: Collection) -> Collection {
        accumulated + next
    }
    #else
    public static func buildBlock(_ components: Collection...) -> Collection {
        components.reduce(Collection(), +)
    }
    #endif

    public static func buildArray(_ components: [Collection]) -> Collection {
        components.reduce(Collection(), +)
    }

    public static func buildEither(first component: Collection) -> Collection {
        component
    }

    public static func buildEither(second component: Collection) -> Collection {
        component
    }

    public static func buildExpression(_ element: Element) -> Collection {
        Collection(repeating: element, count: 1)
    }

    public static func buildExpression(_ component: Collection) -> Collection {
        component
    }

    public static func buildLimitedAvailability(_ component: Collection) -> Collection {
        component
    }

    public static func buildOptional(_ component: Collection?) -> Collection {
        component ?? Collection()
    }
}

extension RangeReplaceableCollection {
    public typealias Builder = RangeReplaceableCollectionBuilder<Self>

    public static func build(@Builder _ build: () -> Self) -> Self {
        build()
    }
}
