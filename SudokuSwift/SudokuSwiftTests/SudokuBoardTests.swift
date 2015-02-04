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
		let b = SudokuBoard()
		for c in b.cells {
			XCTAssertEqual(c.units.count, 3, "Each cell belongs in 3 units. Failed \(c.name)")
		}
		
		let c2 = b.getCellByName("C2")!
		XCTAssertEqual(b.getCellByName("A2")!, c2.units[0][0])
		XCTAssertEqual(b.getCellByName("C3")!, c2.units[1][2])
		XCTAssertEqual(b.getCellByName("C3")!, c2.units[2][8])
	}
	
	func testPeers() {
		let b = SudokuBoard()
		for c in b.cells {
			XCTAssertEqual(c.peers.count, 20, "Each cell must have 20 peers. Failed \(c.name)")
			XCTAssert(!c.peers.containsObject(c), "A cell cannot be its own peer. Failed \(c.name)")
		}
		//** This is the same as:
		// XCTAssert(b.cells.all({$0.peers.count == 20 && !$0.peers.containsObject($0)}))
	}
	
	func testSolveEasy() {
		let b = SudokuBoard(initialState: "..3.2.6..9..3.5..1..18.64....81.29..7.......8..67.82....26.95..8..2.3..9..5.1.3..")
		let solution = "483921657967345821251876493548132976729564138136798245372689514814253769695417382"
		
		println(b.initialState)
		println(b.prettyInitialState)
		println(b.prettyValues)
		
	}
	
	func testSolveHard() {
		
	}
	
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
