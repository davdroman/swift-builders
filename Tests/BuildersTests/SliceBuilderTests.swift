import Builders
import BuildersTestSupport
import XCTest

final class SliceBuilderTests: XCTestCase {
    func testBuilder_arraySliceOfAny() {
        let sut = Slice<Array<Any>>.build {
            if true {
                1
            }
            false
            if `false` {
                "c"
            } else if `false` {
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
        let sut = Slice<Array<Int>>.build {
            Slice([420, 69])
            if `false` {
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
        XCTAssertEqual(sut.count, 6)
        XCTAssertEqual(sut[0], 420)
        XCTAssertEqual(sut[1], 69)
        XCTAssertEqual(sut[2], 39)
        XCTAssertEqual(sut[3], 32)
        XCTAssertEqual(sut[4], 21)
        XCTAssertEqual(sut[5], 1)
    }

    func testBuilder_arraySliceOfOptional() {
        let sut = Slice<Array<Int?>>.build {
            Slice([420, 69])
            if `false` {
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
        XCTAssertEqual(sut.count, 8)
        XCTAssertEqual(sut[0], 420)
        XCTAssertEqual(sut[1], 69)
        XCTAssertEqual(sut[2], nil)
        XCTAssertEqual(sut[3], 39)
        XCTAssertEqual(sut[4], 32)
        XCTAssertEqual(sut[5], 21)
        XCTAssertEqual(sut[6], 1)
        XCTAssertEqual(sut[7], nil)
    }
}
