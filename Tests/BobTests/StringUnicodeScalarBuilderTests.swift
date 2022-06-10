import Bob
import Utils
import XCTest

final class StringUnicodeScalarBuilderTests: XCTestCase {
    func testBuilder() {
        let sut = String.UnicodeScalarView.build {
            if true {
                "1"
            }
            "false".unicodeScalars
            if `false` {
                "c"
            } else if `false` {
                "4"
            } else {
                "e"
            }
            for i in 0..<3 {
                "\(i)".unicodeScalars
            }
            "1"
        }
        XCTAssert(sut.elementsEqual("1falsee0121".unicodeScalars))
    }
}
