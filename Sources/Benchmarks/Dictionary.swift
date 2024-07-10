import Benchmark
import Builders
import BuildersTestSupport

let dictionary = BenchmarkSuite(name: "") {
	$0.benchmark("Dictionary<String, Any>.build") {
		_ = [String: Any].build {
			if true {
				["a": false]
			}
			("b", 3)
			if `false` {
				("c", 23.32)
			} else if `false` {
				["d": 23.32]
			} else {
				("b", "xyz")
				("e", "overriden")
			}
			["f": "overriden again"]
			for i in 0...3 {
				("f", i)
			}
		}
	}
	$0.benchmark("Dictionary<String, Double>.build") {
		_ = [String: Double].build {
			if true {
				["a": 2]
			}
			("b", 3)
			if `false` {
				("c", 23.32)
			} else if `false` {
				["d": 23.32]
			} else {
				("b", 523)
				("e", 12)
			}
			["f": 43]
			for i in 0...3 {
				("f", Double(i))
			}
		}
	}
	$0.benchmark("Dictionary<String, Double?>.build") {
		_ = [String: Double?].build {
			if true {
				["a": 2]
			}
			("b", 3)
			if `false` {
				("c", nil)
			} else if `false` {
				["d": 23.32]
			} else {
				("b", 523)
				("e", nil)
			}
			for i in 0...3 {
				("f", Double(i))
			}
			["f": nil]
		}
	}
}
