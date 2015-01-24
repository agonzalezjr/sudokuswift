//
//  Array+ExtensionTests.swift
//  SudokuSwift
//
//  Created by Gonzalez, Andy on 1/23/15.
//
//

import XCTest

class Array_ExtensionTests: XCTestCase {

	func testAll() {
		let empty: Array<Int> = []
		XCTAssertTrue(empty.all({$0 > 0}), "all() is true for empty array")
		
		let allPositive = [1, 2, 3]
		XCTAssertTrue(allPositive.all({$0 > 0}), "all() is true if all elements satisfy the condition")
		XCTAssertFalse(allPositive.all({$0 < 0}), "all() is false if no element satisfies the condition")
		
		let mixed = [-1, 1]
		XCTAssertFalse(mixed.all({$0 > 0}), "all() is false if an element fails the condition")
	}
	
	func testAny() {
		let empty: Array<Int> = []
		XCTAssertFalse(empty.any({$0 > 0}), "any() is false for empty array")
		
		let allPositive = [1, 2, 3]
		XCTAssertTrue(allPositive.any({$0 > 0}), "any() is true if all elements satisfy the condition")
		XCTAssertFalse(allPositive.any({$0 < 0}), "any() is false if no element satisfies the condition")
		
		let mixed = [-1, 1]
		XCTAssertTrue(mixed.any({$0 > 0}), "any() is true if an element satisfies the condition")
		
	}

}
