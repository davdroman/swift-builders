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
    if let userId {
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
        if let userId {
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
    if let userId {
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

swift-driver version: 1.127.8 Apple Swift version 6.2 (swiftlang-6.2.0.13.10 clang-1700.3.13.4)
Target: arm64-apple-macosx15.0

$ swift run -c release Benchmarks

name                              time        std        iterations
-------------------------------------------------------------------
Array<Any>.build                  1000.000 ns ± 213.28 %    1000000
Array<Int>.build                   292.000 ns ±  38.05 %    1000000
Array<Int?>.build                  333.000 ns ±  39.16 %    1000000
ArraySlice<Any>.build             1666.000 ns ±  15.11 %     838973
ArraySlice<Int>.build              583.000 ns ±  25.48 %    1000000
ArraySlice<Int?>.build             750.000 ns ±  25.07 %    1000000
ContiguousArray<Any>.build        1000.000 ns ±  16.90 %    1000000
ContiguousArray<Int>.build         292.000 ns ±  28.81 %    1000000
ContiguousArray<Int?>.build        333.000 ns ±  25.56 %    1000000
Data.build                        1292.000 ns ±  33.26 %    1000000
Dictionary<String, Any>.build     3125.000 ns ±  39.45 %     429524
Dictionary<String, Double>.build  1917.000 ns ±  22.21 %     704823
Dictionary<String, Double?>.build 1959.000 ns ±  11.84 %     697616
Set<AnyHashable>.build            3375.000 ns ±  14.42 %     406280
Set<Int>.build                     417.000 ns ±  24.28 %    1000000
Set<Int?>.build                   1000.000 ns ±  83.12 %    1000000
Slice<Array<Any>>.build           1875.000 ns ±  20.45 %     745071
Slice<Array<Int>>.build            417.000 ns ±  86.04 %    1000000
Slice<Array<Int?>>.build           625.000 ns ±  18.40 %    1000000
String.build                       292.000 ns ±  41.98 %    1000000
String.UnicodeScalarView.build    3417.000 ns ±  16.51 %     393246
String.UTF8View.build              750.000 ns ±  18.12 %    1000000
Substring.build                    458.000 ns ±  25.24 %    1000000
Substring.UnicodeScalarView.build 6291.000 ns ±   7.86 %     224039
Substring.UTF8View.build           959.000 ns ±  17.96 %    1000000
```
