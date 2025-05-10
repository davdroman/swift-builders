import Builders
import Foundation

// MARK: ArrayBuilder

struct MailLink {
	var to: [String]? = nil
	var cc: [String]? = nil
	var subject: String? = nil
	var body: String? = nil
}

extension MailLink {
	var scheme: String {
		"mailto"
	}

	var host: String {
		to?.joined(separator: ",") ?? ""
	}

	@ArrayBuilder<URLQueryItem>
	var queryItems: [URLQueryItem] {
		if let cc {
			URLQueryItem(name: "cc", value: cc.joined(separator: ","))
		}
		if let subject {
			URLQueryItem(name: "subject", value: subject)
		}
		if let body {
			URLQueryItem(name: "body", value: body)
		}
	}

	var url: URL? {
		var components = URLComponents(string: "\(scheme):\(host)")!
		components.queryItems = queryItems
		return components.url
	}
}

MailLink(to: ["world@example.com"], cc: nil, subject: "Hello, World", body: "It's me, Blob").url!

// MARK: DictionaryBuilder

@DictionaryBuilder<String, String>
func checkoutAnalyticsEvent(didSucceed: Bool, purchaseAmount: Decimal, userId: String?) -> [String: String] {
	["success": didSucceed ? "true" : "false"]
	if purchaseAmount > 0 {
		["amount": purchaseAmount.formatted(.number.precision(.fractionLength(2)))]
	} else {
		["isFree": "true"]
	}
	if let userId {
		["userId": userId]
	} else {
		["isGuest": "true"]
	}
}

checkoutAnalyticsEvent(didSucceed: false, purchaseAmount: Decimal(4.50), userId: "def")
checkoutAnalyticsEvent(didSucceed: false, purchaseAmount: Decimal(4.50), userId: nil)
checkoutAnalyticsEvent(didSucceed: true, purchaseAmount: Decimal(4.50), userId: "abc")
checkoutAnalyticsEvent(didSucceed: true, purchaseAmount: Decimal(0), userId: nil)
