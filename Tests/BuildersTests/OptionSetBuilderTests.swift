import Builders
import Testing

@Suite
struct OptionSetBuilderTests {
	@Test func empty() {
		struct Options: OptionSet {
			let rawValue: Int
			static let a = Options(rawValue: 1 << 0)
			static let b = Options(rawValue: 1 << 1)
			static let c = Options(rawValue: 1 << 2)
		}
		let sut = Options.build {}
		#expect(sut.isEmpty)
	}

	@Test func build() {
		struct Options: OptionSet {
			let rawValue: Int
			static let a = Options(rawValue: 1 << 0)
			static let b = Options(rawValue: 1 << 1)
			static let c = Options(rawValue: 1 << 2)
			static let d = Options(rawValue: 1 << 3)
			static let e = Options(rawValue: 1 << 4)
			static let f = Options(rawValue: 1 << 5)
		}
		let sut = Options.build {
			if true {
				Options.a
			}
			Options.b
			if false {
				Options.c
			} else if false {
				Options.d
			} else {
				[Options.e, Options.f]
			}
			for _ in 0..<3 {
				Options.a
			}
			Options.b
		}
		#expect(sut == [.a, .b, .e, .f])
	}
}
