import Bob
import XCTest

final class DictionaryBuilderTests: XCTestCase {
    func testBuilder() {
        let sut = [String: Any].build {
            if true {
                ["a": true]
            }
            ["b": 2]
            if `false` {
                ["c": "3"]
            } else if `false` {
                ["d": false]
            } else {
                ["e": false]
            }
            for i in 0..<3 {
                ("\(i)", "loop")
            }
            ["1": "newloop"]
            ("2", "tuple")
        }
        XCTAssertEqual(sut.keys.count, 6)
        XCTAssertEqual(sut["a"] as? Bool, true)
        XCTAssertEqual(sut["b"] as? Int, 2)
        XCTAssertNil(sut["c"])
        XCTAssertNil(sut["d"])
        XCTAssertEqual(sut["e"] as? Bool, false)
        XCTAssertEqual(sut["0"] as? String, "loop")
        XCTAssertEqual(sut["1"] as? String, "newloop")
        XCTAssertEqual(sut["2"] as? String, "tuple")
        XCTAssertNil(sut["3"])
    }
}
