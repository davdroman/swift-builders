import Benchmark

let suites = [
    array,
    arraySlice,
    contiguousArray,
    slice,
    string,
    stringUnicodeScalar,
    substring,
    substringUnicodeScalar,
]

Benchmark.main(suites)
