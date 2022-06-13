#if canImport(Foundation)
import Foundation
#endif

public typealias ArrayBuilder<Element> = Array<Element>.Builder

public typealias ArraySliceBuilder<Element> = ArraySlice<Element>.Builder

public typealias ContiguousArrayBuilder<Element> = ContiguousArray<Element>.Builder

#if canImport(Foundation)
public typealias DataBuilder = Data.Builder
#endif

public typealias DictionaryBuilder<Key: Hashable, Value> = Dictionary<Key, Value>.Builder

public typealias SetBuilder<Element: Hashable> = Set<Element>.Builder

public typealias SliceBuilder<Base: RangeReplaceableCollection> = Slice<Base>.Builder

public typealias StringBuilder = String.Builder

public typealias StringUTF8ViewBuilder = String.UTF8View.Builder

public typealias StringUnicodeScalarViewBuilder = String.UnicodeScalarView.Builder

public typealias SubstringBuilder = Substring.Builder

public typealias SubstringUTF8ViewBuilder = Substring.UTF8View.Builder

public typealias SubstringUnicodeScalarViewBuilder = Substring.UnicodeScalarView.Builder
