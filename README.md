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
- `OptionSetBuilder`
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

name                              time        std        iterations
-------------------------------------------------------------------
Array<Any>.build                   958.000 ns ±  30.64 %    1000000
Array<Int>.build                   333.000 ns ±  47.87 %    1000000
Array<Int?>.build                  416.000 ns ±  36.81 %    1000000
ArraySlice<Any>.build             1458.000 ns ±  21.46 %     960751
ArraySlice<Int>.build              625.000 ns ±  33.75 %    1000000
ArraySlice<Int?>.build             625.000 ns ±  31.33 %    1000000
ContiguousArray<Any>.build         958.000 ns ±  25.48 %    1000000
ContiguousArray<Int>.build         333.000 ns ±  83.54 %    1000000
ContiguousArray<Int?>.build        292.000 ns ±  49.75 %    1000000
Data.build                        1208.000 ns ±  27.73 %    1000000
Dictionary<String, Any>.build     3375.000 ns ±  22.78 %     410390
Dictionary<String, Double>.build  2208.000 ns ±  25.88 %     635931
Dictionary<String, Double?>.build 2250.000 ns ±  18.23 %     613650
OptionSet.build                    125.000 ns ±  70.59 %    1000000
Set<AnyHashable>.build            3875.000 ns ±  69.52 %     358720
Set<Int>.build                     417.000 ns ±  94.61 %    1000000
Set<Int?>.build                    958.000 ns ± 510.43 %    1000000
Slice<Array<Any>>.build           1792.000 ns ±  36.33 %     756470
Slice<Array<Int>>.build            500.000 ns ±  82.52 %    1000000
Slice<Array<Int?>>.build           625.000 ns ±  25.64 %    1000000
String.build                       292.000 ns ± 109.27 %    1000000
String.UnicodeScalarView.build    3333.000 ns ±  14.47 %     421296
String.UTF8View.build              833.000 ns ±  34.12 %    1000000
Substring.build                    417.000 ns ±  40.89 %    1000000
Substring.UnicodeScalarView.build 8291.000 ns ±  11.36 %     167628
Substring.UTF8View.build           875.000 ns ±  24.60 %    1000000
```
