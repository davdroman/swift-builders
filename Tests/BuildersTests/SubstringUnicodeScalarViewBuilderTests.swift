import Builders
import Testing

@Suite
struct SubstringUnicodeScalarBuilderTests {
	@Test func empty() {
		let sut = Substring.UnicodeScalarView.build {}
		#expect(sut.isEmpty)
	}

	@Test func build() {
		let sut = Substring.UnicodeScalarView.build {
			if true {
				"1"
			}
			"false"[...].unicodeScalars
			if false {
				"c"
			} else if false {
				"4"
			} else {
				"e"
			}
			for i in 0..<3 {
				"\(i)"[...].unicodeScalars
			}
			"1"
		}
		#expect(sut.elementsEqual("1falsee0121"[...].unicodeScalars))
	}
}
