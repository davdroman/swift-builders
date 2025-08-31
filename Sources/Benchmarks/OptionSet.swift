@preconcurrency import Benchmark
import Builders

let optionSet = BenchmarkSuite(name: "") {
	struct Options: OptionSet {
		let rawValue: Int
		static let a = Options(rawValue: 1 << 0)
		static let b = Options(rawValue: 1 << 1)
		static let c = Options(rawValue: 1 << 2)
		static let d = Options(rawValue: 1 << 3)
		static let e = Options(rawValue: 1 << 4)
		static let f = Options(rawValue: 1 << 5)
	}
	$0.benchmark("OptionSet.build") {
		_ = Options.build {
			if true {
				Options.a
			}
			Options.b
			if false {
				Options.c
			} else if false {
				Options.d
			} else {
				[Options.e, Options.f]
			}
			for _ in 0..<3 {
				Options.a
			}
			Options.b
		}
	}
}
