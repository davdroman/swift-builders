import Builders
import Testing

@Suite
struct DictionaryBuilderTests {
	@Test func empty() {
		let sut = [String: Any].build {}
		#expect(sut.isEmpty)
	}

	@Test func any() {
		let sut = [String: Any].build {
			if true {
				["a": false]
			}
			("b", 3)
			if false {
				("c", 23.32)
			} else if false {
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
		#expect(sut.count == 4)
		#expect(sut["a"] as? Bool == false)
		#expect(sut["b"] as? String == "xyz")
		#expect(sut["c"] == nil)
		#expect(sut["d"] == nil)
		#expect(sut["e"] as? String == "overriden")
		#expect(sut["f"] as? Int == 3)
	}

	@Test func double() {
		let sut = [String: Double].build {
			if true {
				["a": 2]
			}
			("b", 3)
			if false {
				("c", 23.32)
			} else if false {
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
		#expect(sut.count == 4)
		#expect(sut["a"] == 2)
		#expect(sut["b"] == 523)
		#expect(sut["c"] == nil)
		#expect(sut["d"] == nil)
		#expect(sut["e"] == 12)
		#expect(sut["f"] == 3)
	}

	@Test func optional() {
		let sut = [String: Double?].build {
			if true {
				["a": 2]
			}
			("b", 3)
			if false {
				("c", nil)
			} else if false {
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
		#expect(sut.count == 4)
		#expect(sut["a"] == 2)
		#expect(sut["b"] == 523)
		#expect(sut["c"] == Double??.none)
		#expect(sut["d"] == Double??.none)
		#expect(sut["e"] == Double?.none)
		#expect(sut["f"] == Double?.none)
	}
}
