# Swift Builders

[![CI](https://github.com/davdroman/swift-builders/actions/workflows/ci.yml/badge.svg)](https://github.com/davdroman/swift-builders/actions/workflows/ci.yml)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fdavdroman%2Fswift-builders%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/davdroman/swift-builders)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fdavdroman%2Fswift-builders%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/davdroman/swift-builders)

A collection of useful result builders for Swift and Foundation value types.

## Motivation

Arrays, dictionaries, and other collection-based types in Swift are relatively simple to construct and mutate.

However, things get tricky when the contained elements depend on certain conditions or awkward logic. A prime example of this is constructing a payload to send to an analytics service. The resulting code might look like this:

```swift
func checkoutAnalyticsEvent(didSucceed: Bool, purchaseAmount: Decimal, userId: String?) -> [String: String] {
    var event: [String: String] = [:]
    event["success"] = didSucceed ? "true" : "false"
    if purchaseAmount > 0 {
        event["amount"] = purchaseAmount.formatted(.number.precision(.fractionLength(2)))
    } else {
        event["isFree"] = "true"
    }
    if let userId = userId {
        event["userId"] = userId
    } else {
        event["isGuest"] = "true"
    }
    return event
}
```

It's not bad, but it's definitely not as Swifty as one would expect.

We're sprinkling imperative code on what should just be a description of our payload. Not only does this make it harder to reason about the code at a glance, but it also leaves too much leeway for unintended mutations.

Thankfully, there's a better way...

## Getting started

Swift Builders enables result builder syntax for most `Collection` types in Swift and Foundation.

For example, by leveraging `Dictionary.build`, our use case above becomes:

```swift
import Builders

func checkoutAnalyticsEvent(didSucceed: Bool, purchaseAmount: Decimal, userId: String?) -> [String: String] {
    return [String: String].build {
        ["success": didSucceed ? "true" : "false"]
        if purchaseAmount > 0 {
            ["amount": purchaseAmount.formatted(.number.precision(.fractionLength(2)))]
        } else {
            ["isFree": "true"]
        }
        if let userId = userId {
            ["userId": userId]
        } else {
            ["isGuest": "true"]
        }
    }
}
```

We can even annotate our function with the `@DictionaryBuilder` attribute to make the function body behave like the builder body itself (think `@ViewBuilder`):

```swift
import Builders

@DictionaryBuilder<String, String>
func checkoutAnalyticsEvent(didSucceed: Bool, purchaseAmount: Decimal, userId: String?) -> [String: String] {
    ["success": didSucceed ? "true" : "false"]
    if purchaseAmount > 0 {
        ["amount": purchaseAmount.formatted(.number.precision(.fractionLength(2)))]
    } else {
        ["isFree": "true"]
    }
    if let userId = userId {
        ["userId": userId]
    } else {
        ["isGuest": "true"]
    }
}
```

This is only a small demonstration of the power of result builders applied to Swift's native types.

The library offers a variety of builders out of the box:

- `ArrayBuilder`
- `ArraySliceBuilder`
- `ContiguousArrayBuilder`
- `DataBuilder`
- `DictionaryBuilder`
- `SetBuilder`
- `SliceBuilder`
- `StringBuilder`
- `StringUnicodeScalarViewBuilder`
- `StringUTF8ViewBuilder`
- `SubstringBuilder`
- `SubstringUnicodeScalarViewBuilder`
- `SubstringUTF8ViewBuilder`

## Benchmarks

```
MacBook Pro (14-inch, 2021)
Apple M1 Pro (10 cores, 8 performance and 2 efficiency)
32 GB Memory

$ swiftc -version

swift-driver version: 1.120.5 Apple Swift version 6.1.2 (swiftlang-6.1.2.1.2 clang-1700.0.13.5)
Target: arm64-apple-macosx15.0

$ swift run -c release Benchmarks

name                              time        std         iterations
--------------------------------------------------------------------
Array<Any>.build                  1041.000 ns ± 291.11 %     1000000
Array<Int>.build                   291.000 ns ±  41.23 %     1000000
Array<Int?>.build                  375.000 ns ±  51.25 %     1000000
ArraySlice<Any>.build             1708.000 ns ±  87.26 %      810804
ArraySlice<Int>.build              542.000 ns ±  32.81 %     1000000
ArraySlice<Int?>.build             625.000 ns ±  24.91 %     1000000
ContiguousArray<Any>.build        1041.000 ns ±  95.28 %     1000000
ContiguousArray<Int>.build         291.000 ns ±  52.85 %     1000000
ContiguousArray<Int?>.build        292.000 ns ±  70.74 %     1000000
Data.build                        1208.000 ns ±  63.24 %     1000000
Dictionary<String, Any>.build     3500.000 ns ± 164.78 %      406214
Dictionary<String, Double>.build  2209.000 ns ± 176.28 %      572222
Dictionary<String, Double?>.build 2250.000 ns ±  30.13 %      609326
Set<AnyHashable>.build            4250.000 ns ±  21.22 %      353217
Set<Int>.build                     417.000 ns ±  32.45 %     1000000
Set<Int?>.build                    875.000 ns ±  13.62 %     1000000
Slice<Array<Any>>.build           1875.000 ns ±   8.64 %      731109
Slice<Array<Int>>.build            417.000 ns ±  17.91 %     1000000
Slice<Array<Int?>>.build           584.000 ns ± 2492.64 %    1000000
String.build                       291.000 ns ±  21.61 %     1000000
String.UnicodeScalarView.build    3333.000 ns ± 284.10 %      421413
String.UTF8View.build              708.000 ns ±  34.61 %     1000000
Substring.build                    542.000 ns ±  47.97 %     1000000
Substring.UnicodeScalarView.build 8458.000 ns ±   9.40 %      164117
Substring.UTF8View.build           875.000 ns ±  21.03 %     1000000
```
