import XCTest
@testable import Bob

final class BobTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Bob().text, "Hello, World!")
    }
}
