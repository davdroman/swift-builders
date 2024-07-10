@resultBuilder
public struct _AppendableCollectionBuilder<Collection: _AppendableCollection> {
	public typealias Element = Collection.Element
	
	@inlinable
	public static func buildPartialBlock(first: Collection) -> Collection {
		first
	}
	
	public static func buildPartialBlock(accumulated: Collection, next: Collection) -> Collection {
		var accumulated = accumulated
		accumulated.append(contentsOf: next)
		return accumulated
	}
	
	public static func buildArray(_ components: [Collection]) -> Collection {
		Collection(components.joined())
	}
	
	@inlinable
	public static func buildEither(first component: Collection) -> Collection {
		component
	}
	
	@inlinable
	public static func buildEither(second component: Collection) -> Collection {
		component
	}
	
	public static func buildExpression(_ element: Element) -> Collection {
		Collection(CollectionOfOne(element))
	}
	
	@inlinable
	public static func buildExpression(_ component: Collection) -> Collection {
		component
	}
	
	@inlinable
	public static func buildLimitedAvailability(_ component: Collection) -> Collection {
		component
	}
	
	public static func buildOptional(_ component: Collection?) -> Collection {
		component ?? Collection(EmptyCollection())
	}
}

extension _AppendableCollection {
	public typealias Builder = _AppendableCollectionBuilder<Self>
	
	@inlinable
	public static func build(@Builder _ build: () -> Self) -> Self {
		build()
	}
}
