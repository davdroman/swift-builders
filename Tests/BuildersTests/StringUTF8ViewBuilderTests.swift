import Builders
import Testing

@Suite
struct StringUTF8ViewBuilderTests {
	@Test func empty() {
		let sut = String.UTF8View.build {}
		#expect(sut.isEmpty)
	}

	@Test func build() {
		let sut = String.UTF8View.build {
			if true {
				"1".utf8
			}
			"false".utf8
			if false {
				99
			} else if false {
				"4".utf8
			} else {
				97
			}
			for i in 0..<3 {
				"\(i)".utf8
			}
			107
		}
		#expect(String(sut) == "1falsea012k")
	}
}
