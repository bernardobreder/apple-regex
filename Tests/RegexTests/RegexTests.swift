//
//  DataStoreBackupTests.swift
//  DataStore
//
//  Created by Bernardo Breder on 24/12/16.
//
//

import XCTest
import Foundation
@testable import Regex

// https://developer.apple.com/reference/foundation/nsregularexpression
// https://www.raywenderlich.com/downloads/RW-NSRegularExpression-Cheatsheet.pdf

class RegexTests: XCTestCase {
    
    func testSwiftListTest() throws {
        let regex = Regex("[a-zA-Z]+\\.([a-zA-Z]+)\\/(.*)", groupCount: 2)
        XCTAssertTrue(regex.matches("DataStoreTests.DataStoreBackupTests/testManyPages")!.count > 0)
        XCTAssertEqual(["DataStoreTests.DataStoreBackupTests/testManyPages", "DataStoreBackupTests", "testManyPages"], regex.matches("DataStoreTests.DataStoreBackupTests/testManyPages")!)
    }
    
    func test() {
        _ = Regex("\\", groupCount: 0)//.match("\\")
        XCTAssertEqual(["Test 'abc' passed", "abc", "passed"], Regex("^Test '(.*)' (passed|failed)", groupCount: 2).matches("Test 'abc' passed ...")!)
                XCTAssertEqual(["Test 'abc' failed", "abc", "failed"], Regex("^Test '(.*)' (passed|failed)", groupCount: 2).matches("Test 'abc' failed ...")!)
        XCTAssertEqual("teste", Regex(".*(teste).*\n$", groupCount: 1).matches("ação teste ação\n")![1])
//        _ = Regex("\\").first("")
//        _ = Regex("[a-z]").match("a")
//        _ = Regex("[a-z]").match("1")
//        _ = Regex("[a-z]").match("A")
//        _ = Regex("[a-z]", caseInsensitive: true).match("A")
//        _ = Regex("[a-z]*").match("")
//        _ = Regex("[a-z]*").first("ab fff abd")
//        _ = Regex("[a-z]*").match("ab")
//        _ = Regex("[a-z]+\\(").match("ab(")
//        _ = Regex("[a-z]+\\([0-9]+\\)").match("ab(2)")
//        _ = Regex("([a-z]+)\\(([0-9]+)\\)").matches("ab(2)")
//        _ = Regex.email.match("ab@a.cj")
//        _ = Regex("([a-z]+) ([a-z]+)").matches("s s")
//        _ = Regex("(\\d\\d?):(\\d\\d)").matches("1:33")
//        _ = Regex("^\\d+$").match("11 2")
//        _ = Regex("\\w+").match("tod")
//        _ = Regex("\\w+").match("to s")
//        _ = Regex("\".*\"").first("\"ddddd\"")
//        _ = Regex("^-?[0-9]+$").first("-5423")
//        _ = Regex("^A[^a]").first("Ac")
//        _ = Regex("^([A-Z]+) ([A-Za-z/]+) ([A-Z0-9./]+)$").matches("GET /doc HTTP/1.1")
//        _ = Regex("^person_(\\d+).page$").matches("person_123.page")
//        _ = Regex("^person_(\\d+).page$").match("person_123.page")
//        _ = Regex("^person_(\\d+).page$").match("person_123.db")
//        _ = Regex("^person_(\\d+).page$").match("phone_123.page")
//        XCTAssertEqual("123", Regex("\\d+").first("aaa123bbb321"))
    }
    
}
