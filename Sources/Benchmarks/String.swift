@preconcurrency import Benchmark
import Builders

let string = BenchmarkSuite(name: "") {
	$0.benchmark("String.build") {
		_ = String.build {
			if true {
				"1" as Character
			}
			"false"
			if false {
				"c" as Character
			} else if false {
				"4"
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
