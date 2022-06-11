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

name                              time        std         iterations
--------------------------------------------------------------------
Array<Any>.build                  1833.000 ns ±  10.03 %      751210
Array<Int>.build                   542.000 ns ± 1109.19 %    1000000
Array<Int?>.build                  709.000 ns ±   6.30 %     1000000
ArraySlice<Any>.build             2709.000 ns ±   5.31 %      508836
ArraySlice<Int>.build              875.000 ns ±   9.25 %     1000000
ArraySlice<Int?>.build            1167.000 ns ±   6.92 %     1000000
ContiguousArray<Any>.build        1916.000 ns ±   5.32 %      731104
ContiguousArray<Int>.build         542.000 ns ±   9.45 %     1000000
ContiguousArray<Int?>.build        750.000 ns ±   8.32 %     1000000
Data.build                         875.000 ns ±  13.53 %     1000000
Dictionary<String, Any>.build     4208.000 ns ±   8.37 %      328386
Dictionary<String, Double>.build  2458.000 ns ±   5.20 %      572290
Dictionary<String, Double?>.build 2542.000 ns ±  11.36 %      548408
Set<Any>.build                    5166.000 ns ±  12.86 %      259233
Set<Int>.build                     750.000 ns ±  14.52 %     1000000
Set<Int?>.build                   1333.000 ns ±  31.97 %     1000000
Slice<Array<Any>>.build           2250.000 ns ±  15.84 %      619619
Slice<Array<Int>>.build            584.000 ns ±  20.85 %     1000000
Slice<Array<Int?>>.build           917.000 ns ±  20.96 %     1000000
String.build                       500.000 ns ±  15.69 %     1000000
String.UnicodeScalarView.build    3959.000 ns ±   6.15 %      348816
String.UTF8View.build              542.000 ns ±   9.83 %     1000000
Substring.build                   1709.000 ns ±  15.62 %      802669
Substring.UnicodeScalarView.build 5084.000 ns ±  13.23 %      274238
Substring.UTF8View.build          1333.000 ns ± 499.75 %     1000000
```
