import Benchmark
import Bob
import Utils

let contiguousArray = BenchmarkSuite(name: "") {
    $0.benchmark("ContiguousArray<Any>.build") {
        _ = ContiguousArray<Any>.build {
            if true {
                1
            }
            false
            if `false` {
                "c"
            } else if `false` {
                4
            } else {
                "e"
            }
            for i in 0..<3 {
                "\(i)"
            }
            "1"
        }
    }
    $0.benchmark("ContiguousArray<Int>.build") {
        _ = ContiguousArray<Int>.build {
            [420, 69]
            if `false` {
                [120]
                120
            }
            if let some = Int?.none {
                some
            }
            39
            if true {
                [32, 21]
                1
            }
        }
    }
    $0.benchmark("ContiguousArray<Int?>.build") {
        _ = ContiguousArray<Int?>.build {
            [420, 69]
            if `false` {
                [120]
                120
            }
            nil
            39
            if true {
                [32, 21]
                1
            }
            nil
        }
    }
}
