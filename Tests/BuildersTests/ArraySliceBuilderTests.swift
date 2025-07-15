import Builders
import Testing

@Suite
struct ArraySliceBuilderTests {
	@Test func empty() {
		let sut = ArraySlice<Any>.build {}
		#expect(sut.isEmpty)
	}

	@Test func any() {
		let sut = ArraySlice<Any>.build {
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
		#expect(sut.count == 7)
		#expect(sut[0] as? Int == 1)
		#expect(sut[1] as? Bool == false)
		#expect(sut[2] as? String == "e")
		#expect(sut[3] as? String == "0")
		#expect(sut[4] as? String == "1")
		#expect(sut[5] as? String == "2")
		#expect(sut[6] as? String == "1")
	}

	@Test func int() {
		let sut = ArraySlice<Int>.build {
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
		let sut = ArraySlice<Int?>.build {
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
