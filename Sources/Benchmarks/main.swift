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
    stringUTF8View,
    substring,
    substringUnicodeScalar,
    substringUTF8View,
]

Benchmark.main(suites)
