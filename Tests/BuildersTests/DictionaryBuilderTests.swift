import Builders
import BuildersTestSupport
import XCTest

final class DictionaryBuilderTests: XCTestCase {
    func testBuilder_anyValues() {
        let sut = [String: Any].build {
            if true {
                ["a": false]
            }
            ("b", 3)
            if `false` {
                ("c", 23.32)
            } else if `false` {
                ["d": 23.32]
            } else {
                ("b", "xyz")
                ("e", "overriden")
            }
            ["f": "overriden again"]
            for i in 0...3 {
                ("f", i)
            }
        }
        XCTAssertEqual(sut.count, 4)
        XCTAssertEqual(sut["a"] as? Bool, false)
        XCTAssertEqual(sut["b"] as? String, "xyz")
        XCTAssertNil(sut["c"])
        XCTAssertNil(sut["d"])
        XCTAssertEqual(sut["e"] as? String, "overriden")
        XCTAssertEqual(sut["f"] as? Int, 3)
    }

    func testBuilder_doubleValues() {
        let sut = [String: Double].build {
            if true {
                ["a": 2]
            }
            ("b", 3)
            if `false` {
                ("c", 23.32)
            } else if `false` {
                ["d": 23.32]
            } else {
                ("b", 523)
                ("e", 12)
            }
            ["f": 43]
            for i in 0...3 {
                ("f", Double(i))
            }
        }
        XCTAssertEqual(sut.count, 4)
        XCTAssertEqual(sut["a"], 2)
        XCTAssertEqual(sut["b"], 523)
        XCTAssertNil(sut["c"])
        XCTAssertNil(sut["d"])
        XCTAssertEqual(sut["e"], 12)
        XCTAssertEqual(sut["f"], 3)
    }

    func testBuilder_optionalDoubleValues() {
        let sut = [String: Double?].build {
            if true {
                ["a": 2]
            }
            ("b", 3)
            if `false` {
                ("c", nil)
            } else if `false` {
                ["d": 23.32]
            } else {
                ("b", 523)
                ("e", nil)
            }
            for i in 0...3 {
                ("f", Double(i))
            }
            ["f": nil]
        }
        XCTAssertEqual(sut.count, 4)
        XCTAssertEqual(sut["a"], 2)
        XCTAssertEqual(sut["b"], 523)
        XCTAssertEqual(sut["c"], Double??.none)
        XCTAssertEqual(sut["d"], Double??.none)
        XCTAssertEqual(sut["e"], Double?.none)
        XCTAssertEqual(sut["f"], Double?.none)
    }
}
