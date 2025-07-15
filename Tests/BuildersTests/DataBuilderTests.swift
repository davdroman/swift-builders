import Builders
import XCTest

final class DataBuilderTests: XCTestCase {
	func testBuilder_emptyData() {
		let sut = Data.build {}
		XCTAssertEqual(sut.isEmpty, true)
	}

	func testBuilder() {
		let sut = Data.build {
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
		XCTAssertEqual(sut, Data("hello abc world".utf8))
	}
}
