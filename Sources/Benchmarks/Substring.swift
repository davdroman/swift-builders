@preconcurrency import Benchmark
import Builders

let substring = BenchmarkSuite(name: "") {
	$0.benchmark("Substring.build") {
		_ = Substring.build {
			if true {
				"1" as Character
			}
			"false"
			if false {
				"c" as Character
			} else if false {
				"4"[...]
			} else {
				"e" as Character
			}
			for i in 0..<3 {
				"\(i)"
			}
			"1" as Character
		}
	}
}
