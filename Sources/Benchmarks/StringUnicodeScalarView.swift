import Benchmark
import Builders
import BuildersTestSupport

let stringUnicodeScalar = BenchmarkSuite(name: "") {
    $0.benchmark("String.UnicodeScalarView.build") {
        _ = String.UnicodeScalarView.build {
            if true {
                "1"
            }
            "false".unicodeScalars
            if `false` {
                "c"
            } else if `false` {
                "4"
            } else {
                "e"
            }
            for i in 0..<3 {
                "\(i)".unicodeScalars
            }
            "1"
        }
    }
}
