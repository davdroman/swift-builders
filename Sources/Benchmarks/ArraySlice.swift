@preconcurrency import Benchmark
import Builders

let arraySlice = BenchmarkSuite(name: "") {
	$0.benchmark("ArraySlice<Any>.build") {
		_ = ArraySlice<Any>.build {
			if true {
				1
			}
			false
			if false {
				"c"
			} else if false {
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
	$0.benchmark("ArraySlice<Int>.build") {
		_ = ArraySlice<Int>.build {
			[420, 69]
			if false {
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
	$0.benchmark("ArraySlice<Int?>.build") {
		_ = ArraySlice<Int?>.build {
			[420, 69]
			if false {
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
