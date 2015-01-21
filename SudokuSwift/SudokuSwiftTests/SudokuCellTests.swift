//
//  SudokuCellTests.swift
//  SudokuSwift
//
//  Created by Gonzalez, Andy on 1/20/15.
//
//

import XCTest

class SudokuCellTests: XCTestCase {

	func testInit() {
		var cell = SudokuCell(name: "A1")
		XCTAssertEqual(cell.name, "A1", "The cell name does not match")
	}
}
