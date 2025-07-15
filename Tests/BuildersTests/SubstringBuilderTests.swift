import Builders
import XCTest

final class SubstringBuilderTests: XCTestCase {
	func testBuilder_emptySubstring() {
		let sut = Substring.build {}
		XCTAssertEqual(sut.isEmpty, true)
	}

	func testBuilder() {
		let sut = Substring.build {
			if true {
				"1" as Character
			}
			"false"
			if false {
				"c" as Character
			} else if false {
				"4"[...]
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
