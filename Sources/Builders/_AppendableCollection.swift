#if canImport(Foundation)
import Foundation
#endif

public protocol _AppendableCollection: Collection {
    @_spi(Internals)
    init(_ elements: some Sequence<Element>)
    @_spi(Internals)
    mutating func append(contentsOf newElements: some Sequence<Element>)
}

extension Array: _AppendableCollection {}

extension ArraySlice: _AppendableCollection {}

extension ContiguousArray: _AppendableCollection {}

#if canImport(Foundation)
extension Data: _AppendableCollection {}
#endif

extension Dictionary: _AppendableCollection {
    @_spi(Internals)
    public init(_ elements: some Sequence<Element>) {
        self.init(elements.lazy.map({ ($0.key, $0.value) }), uniquingKeysWith: { $1 })
    }

    @_spi(Internals)
    public mutating func append(contentsOf newElements: some Sequence<Element>) {
        for element in newElements {
            self[element.key] = element.value
        }
    }
}

extension Set: _AppendableCollection {
    @_spi(Internals)
    public mutating func append(contentsOf newElements: some Sequence<Element>) {
        self.formUnion(newElements)
    }
}

extension Slice: _AppendableCollection where Base: RangeReplaceableCollection {}

extension String: _AppendableCollection {}

extension String.UnicodeScalarView: _AppendableCollection {}

extension String.UTF8View: _AppendableCollection {
    @_spi(Internals)
    public init(_ elements: some Sequence<Element>) {
        var result = String().utf8
        result.append(contentsOf: elements)
        self = result
    }

    @_spi(Internals)
    public mutating func append(contentsOf newElements: some Sequence<Element>) {
        var result = String(self)
        switch newElements {
        case let newElements as String.UTF8View:
            result.append(contentsOf: String(newElements))
        default:
            result.append(contentsOf: String(decoding: Array(newElements), as: UTF8.self))
        }
        self = result.utf8
    }
}

extension Substring: _AppendableCollection {}

extension Substring.UnicodeScalarView: _AppendableCollection {}

extension Substring.UTF8View: _AppendableCollection {
    @_spi(Internals)
    public init(_ elements: some Sequence<Element>) {
        var result = Substring().utf8
        result.append(contentsOf: elements)
        self = result
    }

    @_spi(Internals)
    public mutating func append(contentsOf newElements: some Sequence<Element>) {
        var result = Substring(self)
        switch newElements {
        case let newElements as Substring.UTF8View:
            result.append(contentsOf: Substring(newElements))
        default:
            result.append(contentsOf: Substring(decoding: Array(newElements), as: UTF8.self))
        }
        self = result.utf8
    }
}
