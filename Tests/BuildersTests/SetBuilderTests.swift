import Builders
import XCTest

final class SetBuilderTests: XCTestCase {
	func testBuilder_emptySet() {
		let sut = Set<AnyHashable>.build {}
		XCTAssertEqual(sut.isEmpty, true)
	}

	func testBuilder_setOfAnyHashable() {
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
		XCTAssertEqual(sut, [
			1,
			false,
			"e",
			0,
			2,
			"1",
		])
	}

	func testBuilder_setOfInt() {
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
		XCTAssertEqual(sut, [
			420,
			69,
			39,
			32,
			21,
			1,
		])
	}

	func testBuilder_setOfOptional() {
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
