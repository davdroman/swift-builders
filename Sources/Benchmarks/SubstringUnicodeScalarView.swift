import Benchmark
import Builders
import BuildersTestSupport

let substringUnicodeScalar = BenchmarkSuite(name: "") {
    $0.benchmark("Substring.UnicodeScalarView.build") {
        _ = Substring.UnicodeScalarView.build {
            if true {
                "1"
            }
            "false"[...].unicodeScalars
            if `false` {
                "c"
            } else if `false` {
                "4"
            } else {
                "e"
            }
            for i in 0..<3 {
                "\(i)"[...].unicodeScalars
            }
            "1"
        }
    }
}
