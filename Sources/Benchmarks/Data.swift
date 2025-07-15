@preconcurrency import Benchmark
import Builders
import BuildersTestSupport
import Foundation

let data = BenchmarkSuite(name: "") {
	$0.benchmark("Data.build") {
		_ = Data.build {
			if true {
				104
			}
			101
			if false {
				123
			} else if false {
				234
			} else {
				108
				108
			}
			111
			Data(" ".utf8)
			for i in UInt8(0)..<UInt8(3) {
				97 + i
			}
			Data(" world".utf8)
		}
	}
}
