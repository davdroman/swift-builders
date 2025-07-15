import Builders
import Testing

@Suite
struct StringBuilderTests {
	@Test func empty() {
		let sut = String.build {}
		#expect(sut.isEmpty)
	}

	@Test func build() {
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
		#expect(sut == "1falsee0121")
	}
}
