// MIT License
//
// Copyright (c) 2017 Point-Free
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#if canImport(Foundation)
import Foundation
#endif

public protocol _EmptyInitializable {
    init()
}

public protocol _AppendableCollection: Collection, _EmptyInitializable {
    init(_ element: Element)
    mutating func _append<S: Sequence>(contentsOf newElements: S) where S.Element == Self.Element
}

extension RangeReplaceableCollection {
    @inlinable
    public init(_ element: Element) {
        self.init(repeating: element, count: 1)
    }

    @inlinable
    public mutating func _append<S: Sequence>(contentsOf newElements: S) where S.Element == Self.Element {
        self.append(contentsOf: newElements)
    }
}

extension Array: _AppendableCollection {}

extension ArraySlice: _AppendableCollection {}

extension ContiguousArray: _AppendableCollection {}

#if canImport(Foundation)
extension Data: _AppendableCollection {}
#endif

extension Dictionary: _AppendableCollection {
    @inlinable
    public init(_ element: Element) {
        self = [element.key: element.value]
    }

    @inlinable
    public mutating func _append<S: Sequence>(contentsOf newElements: S) where S.Element == Self.Element {
        for element in newElements {
            self[element.key] = element.value
        }
    }
}

extension Set: _AppendableCollection {
    @inlinable
    public init(_ element: Element) {
        self = [element]
    }

    @inlinable
    public mutating func _append<S: Sequence>(contentsOf newElements: S) where S.Element == Self.Element {
        self.formUnion(newElements)
    }
}

extension Slice: _AppendableCollection, _EmptyInitializable where Base: RangeReplaceableCollection {}

extension String: _AppendableCollection {}

extension String.UTF8View: _AppendableCollection {
    @inlinable
    public init() {
        self = String().utf8
    }

    @inlinable
    public init(_ element: Element) {
        self.init()
        self._append(contentsOf: CollectionOfOne(element))
    }

    @inlinable
    public mutating func _append<S: Sequence>(contentsOf newElements: S) where S.Element == Self.Element {
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

extension String.UnicodeScalarView: _AppendableCollection {}

extension Substring: _AppendableCollection {}

extension Substring.UTF8View: _AppendableCollection {
    @inlinable
    public init() {
        self = Substring().utf8
    }

    @inlinable
    public init(_ element: Element) {
        self.init()
        self._append(contentsOf: CollectionOfOne(element))
    }

    @inlinable
    public mutating func _append<S: Sequence>(contentsOf newElements: S) where S.Element == Self.Element {
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

extension Substring.UnicodeScalarView: _AppendableCollection {}
