import Builders
import Testing

@Suite
struct SetBuilderTests {
	@Test func empty() {
		let sut = Set<AnyHashable>.build {}
		#expect(sut.isEmpty)
	}

	@Test func anyHashable() {
		let sut = Set<AnyHashable>.build {
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
				i
			}
			"1"
		}
		#expect(sut == [
			1,
			false,
			"e",
			0,
			2,
			"1",
		])
	}

	@Test func int() {
		let sut = Set<Int>.build {
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
		#expect(sut == [
			420,
			69,
			39,
			32,
			21,
			1,
		])
	}

	@Test func optional() {
		let sut = Set<Int?>.build {
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
		#expect(sut == [
			420,
			69,
			nil,
			39,
			32,
			21,
			1,
			nil,
		])
	}
}
