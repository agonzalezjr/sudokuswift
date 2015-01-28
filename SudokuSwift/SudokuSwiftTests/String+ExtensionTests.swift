//
//  String+ExtensionTests.swift
//  SudokuSwift
//
//  Created by Gonzalez, Andy on 1/27/15.
//
//

import XCTest

class String_ExtensionTests: XCTestCase {

    func testSubscriptChar() {
		XCTAssertEqual("abc"[0], "a" as Character)
		XCTAssertEqual("abc"[1], Character("b"))
		XCTAssertEqual("abc"[2], Character("c"))
    }

	func testSubscriptString() {
		XCTAssertEqual("abc"[0], "a")
		XCTAssertEqual("abc"[1], "b")
		XCTAssertEqual("abc"[2], "c")
	}

	func testSubscriptRange() {
		XCTAssertEqual("abc"[0...0], "a")
		XCTAssertEqual("abc"[0...1], "ab")
		XCTAssertEqual("abc"[0...2], "abc")
		XCTAssertEqual("abc"[1...2], "bc")
		XCTAssertEqual("abc"[2...2], "c")
	}
	
	func testRange() {
		XCTAssertEqual("abc".index("a"), 0)
		XCTAssertEqual("abc".index("b"), 1)
		XCTAssertEqual("abc".index("c"), 2)
	}
}
