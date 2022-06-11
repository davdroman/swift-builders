# Swift Builders

A collection of useful result builders for Swift and Foundation value types.

## Motivation

## Getting started

## Benchmarks

```
MacBook Pro (14-inch, 2021)
Apple M1 Pro (10 cores, 8 performance and 2 efficiency)
32 GB Memory

$ swift run -c release Benchmarks

name                              time        std        iterations
-------------------------------------------------------------------
Array<Any>.build                  1833.000 ns ±   7.60 %     757726
Array<Int>.build                   542.000 ns ±  15.49 %    1000000
Array<Int?>.build                  709.000 ns ±   9.51 %    1000000
ArraySlice<Any>.build             2750.000 ns ±   5.28 %     511759
ArraySlice<Int>.build              875.000 ns ±   8.40 %    1000000
ArraySlice<Int?>.build            1167.000 ns ±  13.55 %    1000000
ContiguousArray<Any>.build        1917.000 ns ±  12.37 %     729365
ContiguousArray<Int>.build         542.000 ns ±  23.24 %    1000000
ContiguousArray<Int?>.build        750.000 ns ±  13.97 %    1000000
Data.build                         875.000 ns ±  13.55 %    1000000
Dictionary<String, Any>.build     4209.000 ns ±   6.26 %     328025
Dictionary<String, Double>.build  2459.000 ns ±  11.92 %     562007
Dictionary<String, Double?>.build 2583.000 ns ±   5.51 %     526636
Set<Any>.build                    6333.000 ns ±  10.30 %     228224
Set<Int>.build                     750.000 ns ±  11.22 %    1000000
Set<Int?>.build                   1292.000 ns ±  11.42 %    1000000
Slice<Array<Any>>.build           2209.000 ns ±   4.95 %     629537
Slice<Array<Int>>.build            584.000 ns ±  17.10 %    1000000
Slice<Array<Int?>>.build           917.000 ns ±   8.49 %    1000000
String.build                       500.000 ns ±   8.91 %    1000000
String.UnicodeScalarView.build    3958.000 ns ±   3.04 %     351918
String.UTF8View.build              542.000 ns ±  10.33 %    1000000
Substring.build                   1709.000 ns ±   4.41 %     810685
Substring.UnicodeScalarView.build 5084.000 ns ±   3.19 %     274560
Substring.UTF8View.build          1333.000 ns ±   5.89 %    1000000
```
