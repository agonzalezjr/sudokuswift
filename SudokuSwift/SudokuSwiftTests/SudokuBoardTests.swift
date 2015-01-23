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

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
