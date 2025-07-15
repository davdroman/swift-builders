import Builders
import Testing

@Suite
struct SliceBuilderTests {
	@Test func empty() {
		let sut = Slice<[Any]>.build {}
		#expect(sut.isEmpty)
	}

	@Test func any() {
		let sut = Slice<[Any]>.build {
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
		let sut = Slice<[Int]>.build {
			Slice([420, 69])
			if false {
				Slice([120])
				120
			}
			if let some = Int?.none {
				some
			}
			39
			if true {
				Slice([32, 21])
				1
			}
		}
		#expect(sut.count == 6)
		#expect(sut[0] == 420)
		#expect(sut[1] == 69)
		#expect(sut[2] == 39)
		#expect(sut[3] == 32)
		#expect(sut[4] == 21)
		#expect(sut[5] == 1)
	}

	@Test func optional() {
		let sut = Slice<[Int?]>.build {
			Slice([420, 69])
			if false {
				Slice([120])
				120
			}
			nil
			39
			if true {
				Slice([32, 21])
				1
			}
			nil
		}
		#expect(sut.count == 8)
		#expect(sut[0] == 420)
		#expect(sut[1] == 69)
		#expect(sut[2] == nil)
		#expect(sut[3] == 39)
		#expect(sut[4] == 32)
		#expect(sut[5] == 21)
		#expect(sut[6] == 1)
		#expect(sut[7] == nil)
	}
}
