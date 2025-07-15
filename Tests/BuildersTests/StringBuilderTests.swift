import Builders
import XCTest

final class StringBuilderTests: XCTestCase {
	func testBuilder_emptyString() {
		let sut = String.build {}
		XCTAssertEqual(sut.isEmpty, true)
	}

	func testBuilder() {
		let sut = String.build {
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
		XCTAssertEqual(sut, "1falsee0121")
	}
}
