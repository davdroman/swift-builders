import Benchmark

let suites = [
    array,
    arraySlice,
    contiguousArray,
    data,
    slice,
    string,
    stringUnicodeScalar,
    substring,
    substringUnicodeScalar,
]

Benchmark.main(suites)
