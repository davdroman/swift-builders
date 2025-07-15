import Builders
import BuildersTestSupport
import XCTest

final class ArraySliceBuilderTests: XCTestCase {
	func testBuilder_emptyArraySlice() {
		let sut = ArraySlice<Any>.build {}
		XCTAssertEqual(sut.isEmpty, true)
	}

	func testBuilder_arraySliceOfAny() {
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
		XCTAssertEqual(sut.count, 7)
		XCTAssertEqual(sut[0] as? Int, 1)
		XCTAssertEqual(sut[1] as? Bool, false)
		XCTAssertEqual(sut[2] as? String, "e")
		XCTAssertEqual(sut[3] as? String, "0")
		XCTAssertEqual(sut[4] as? String, "1")
		XCTAssertEqual(sut[5] as? String, "2")
		XCTAssertEqual(sut[6] as? String, "1")
	}

	func testBuilder_arraySliceOfInt() {
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
		XCTAssertEqual(sut, [
			420,
			69,
			39,
			32,
			21,
			1,
		])
	}

	func testBuilder_arraySliceOfOptional() {
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
		XCTAssertEqual(sut, [
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
