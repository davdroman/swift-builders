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
    stringUTF8View,
    stringUnicodeScalar,
    substring,
    substringUTF8View,
    substringUnicodeScalar,
]

Benchmark.main(suites)
