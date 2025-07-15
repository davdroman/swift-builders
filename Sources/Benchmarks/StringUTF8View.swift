@preconcurrency import Benchmark
import Builders
import BuildersTestSupport

let stringUTF8View = BenchmarkSuite(name: "") {
	$0.benchmark("String.UTF8View.build") {
		_ = String.UTF8View.build {
			if true {
				"1".utf8
			}
			"false".utf8
			if `false` {
				99
			} else if `false` {
				"4".utf8
			} else {
				97
			}
			for i in 0..<3 {
				"\(i)".utf8
			}
			107
		}
	}
}
