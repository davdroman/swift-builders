import Builders
import BuildersTestSupport
import XCTest

final class SubstringUTF8ViewBuilderTests: XCTestCase {
    func testBuilder() {
        let sut = Substring.UTF8View.build {
            if true {
                "1"[...].utf8
            }
            "false"[...].utf8
            if `false` {
                99
            } else if `false` {
                "4"[...].utf8
            } else {
                97
            }
            for i in 0..<3 {
                "\(i)"[...].utf8
            }
            107
        }
        XCTAssertEqual(Substring(sut), "1falsea012k")
    }
}
