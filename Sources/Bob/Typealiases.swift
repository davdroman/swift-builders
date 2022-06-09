public typealias ArrayBuilder<Element> = RangeReplaceableCollectionBuilder<Array<Element>>
public typealias ArraySliceBuilder<Element> = RangeReplaceableCollectionBuilder<ArraySlice<Element>>
public typealias ContiguousArrayBuilder<Element> = RangeReplaceableCollectionBuilder<ContiguousArray<Element>>
public typealias SliceBuilder<Base: RangeReplaceableCollection> = RangeReplaceableCollectionBuilder<Slice<Base>>
public typealias StringBuilder = RangeReplaceableCollectionBuilder<String>
public typealias StringUnicodeScalarViewBuilder = RangeReplaceableCollectionBuilder<String.UnicodeScalarView>
public typealias SubstringBuilder = RangeReplaceableCollectionBuilder<Substring>
public typealias SubstringUnicodeScalarViewBuilder = RangeReplaceableCollectionBuilder<Substring.UnicodeScalarView>
