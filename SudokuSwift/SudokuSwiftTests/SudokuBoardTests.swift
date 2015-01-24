//
//  SudokuBoardTests.swift
//  SudokuSwift
//
//  Created by Gonzalez, Andy on 1/22/15.
//
//

import XCTest

class SudokuBoardTests: XCTestCase {

    func testInit() {
		let b = SudokuBoard()
		XCTAssertEqual(b.initialState, b.EMPTY_BOARD)
		XCTAssertEqual(countElements(b.initialState), 81)
		XCTAssertFalse(b.isSolved)
	}
	
	func testCells() {
		let b = SudokuBoard()
		XCTAssertEqual(b.cells.count, 81)
		XCTAssertEqual(b.cells[0].name, "A1")
		XCTAssertEqual(b.cells[23].name, "C6")
		XCTAssertEqual(b.cells[80].name, "I9")
	}
	
	func testUnits() {
		// TODO:
	}
	
	func testPeers() {
		// TODO:
	}
	
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
