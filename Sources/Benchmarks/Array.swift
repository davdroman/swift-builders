import Benchmark
import Builders
import BuildersTestSupport

let array = BenchmarkSuite(name: "") {
    $0.benchmark("Array<Any>.build") {
        _ = [Any].build {
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
    $0.benchmark("Array<Int>.build") {
        _ = [Int].build {
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
    $0.benchmark("Array<Int?>.build") {
        _ = [Int?].build {
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
