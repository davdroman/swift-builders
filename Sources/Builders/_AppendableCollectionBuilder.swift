@resultBuilder
public struct _AppendableCollectionBuilder<Collection: _AppendableCollection> {
    public typealias Element = Collection.Element

    #if compiler(>=5.7)
    @inlinable
    public static func buildPartialBlock(first: Collection) -> Collection {
        first
    }

    @inlinable
    public static func buildPartialBlock(accumulated: Collection, next: Collection) -> Collection {
        var accumulated = accumulated
        accumulated.append(contentsOf: next)
        return accumulated
    }
    #else
    @inlinable
    public static func buildBlock(_ components: Collection...) -> Collection {
        components.reduce(into: Collection()) { $0.append(contentsOf: $1) }
    }
    #endif

    @inlinable
    public static func buildArray(_ components: [Collection]) -> Collection {
        components.reduce(into: Collection()) { $0.append(contentsOf: $1) }
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
        Collection(element)
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

extension _AppendableCollection {
    public typealias Builder = _AppendableCollectionBuilder<Self>

    @inlinable
    public static func build(@Builder _ build: () -> Self) -> Self {
        build()
    }
}
