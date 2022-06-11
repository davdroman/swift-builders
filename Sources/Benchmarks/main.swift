import Benchmark

let suites = [
    array,
    arraySlice,
    contiguousArray,
    data,
    dictionary,
    set,
    slice,
    string,
    stringUnicodeScalar,
    substring,
    substringUnicodeScalar,
]

Benchmark.main(suites)
