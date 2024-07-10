import Builders
import BuildersTestSupport
import XCTest

final class StringUTF8ViewBuilderTests: XCTestCase {
	func testBuilder_emptyStringUTF8View() {
		let sut = String.UTF8View.build {}
		XCTAssertEqual(sut.isEmpty, true)
	}

	func testBuilder() {
		let sut = String.UTF8View.build {
			if true {
				"1".utf8
			}
			"false".utf8
			if `false` {
				99
			} else if `false` {
				"4".utf8
			} else {
				97
			}
			for i in 0..<3 {
				"\(i)".utf8
			}
			107
		}
		XCTAssertEqual(String(sut), "1falsea012k")
	}
}
