import Benchmark
import Bob
import Utils

let slice = BenchmarkSuite(name: "") {
    $0.benchmark("Slice<Array<Any>>.build") {
        _ = Slice<Array<Any>>.build {
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
    $0.benchmark("Slice<Array<Int>>.build") {
        _ = Slice<Array<Int>>.build {
            Slice([420, 69])
            if `false` {
                Slice([120])
                120
            }
            if let some = Int?.none {
                some
            }
            39
            if true {
                Slice([32, 21])
                1
            }
        }
    }
    $0.benchmark("Slice<Array<Int?>>.build") {
        _ = Slice<Array<Int?>>.build {
            Slice([420, 69])
            if `false` {
                Slice([120])
                120
            }
            nil
            39
            if true {
                Slice([32, 21])
                1
            }
            nil
        }
    }
}
