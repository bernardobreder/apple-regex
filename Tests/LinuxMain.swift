//
//  RegexTests.swift
//  Regex
//
//  Created by Bernardo Breder.
//
//

import XCTest
@testable import RegexTests

extension RegexTests {

	static var allTests : [(String, (RegexTests) -> () throws -> Void)] {
		return [
			("test", test),
			("testSwiftListTest", testSwiftListTest),
		]
	}

}

XCTMain([
	testCase(RegexTests.allTests),
])

