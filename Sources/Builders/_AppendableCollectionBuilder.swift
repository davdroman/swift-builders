@resultBuilder
public struct _AppendableCollectionBuilder<Collection: _AppendableCollection> {
    public typealias Element = Collection.Element

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
}

extension _AppendableCollection {
    public typealias Builder = _AppendableCollectionBuilder<Self>

    @inlinable
    public static func build(@Builder _ build: () -> Self) -> Self {
        build()
    }
}
