import Builders
import Testing

@Suite
struct StringUnicodeScalarBuilderTests {
	@Test func empty() {
		let sut = String.UnicodeScalarView.build {}
		#expect(sut.isEmpty)
	}

	@Test func build() {
		let sut = String.UnicodeScalarView.build {
			if true {
				"1"
			}
			"false".unicodeScalars
			if false {
				"c"
			} else if false {
				"4"
			} else {
				"e"
			}
			for i in 0..<3 {
				"\(i)".unicodeScalars
			}
			"1"
		}
		#expect(sut.elementsEqual("1falsee0121".unicodeScalars))
	}
}
