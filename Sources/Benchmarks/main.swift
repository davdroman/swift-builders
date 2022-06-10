import Benchmark

let suites = [
    array,
    arraySlice,
    contiguousArray,
    data,
    dictionary,
    slice,
    string,
    stringUnicodeScalar,
    substring,
    substringUnicodeScalar,
]

Benchmark.main(suites)
