import Benchmark
import Bob

/// Used to avoid triggering compiler warnings due to
/// obviously inaccessible codepaths.
let `false`: Bool = false

benchmark("build [Any]") {
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

benchmark("build [Int]") {
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

benchmark("build [Int?]") {
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

Benchmark.main()
