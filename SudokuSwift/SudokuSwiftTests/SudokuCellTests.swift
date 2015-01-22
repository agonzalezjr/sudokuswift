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
		let cell = SudokuCell(name: "A1")
		XCTAssertEqual(cell.name, "A1", "The cell name does not match")
		XCTAssertEqual(cell.values, "123456789")
		XCTAssertEqual(cell.peers.count, 0)
		XCTAssertEqual(cell.units.count, 0)
		XCTAssertFalse(cell.isSolved())
		
		// This isn't calling the descrition or debugDescription methods :(
		// println(cell)
	}
	
	func testValues() {
		let cell = SudokuCell(name: "A1")
		// TODO
	}
	
	func testUnits() {
		let cell = SudokuCell(name: "A1")
		XCTAssertEqual(cell.units.count, 0)
		cell.addUnit([cell, cell]);
		XCTAssertEqual(cell.units.count, 1)
	}
	
	func testPeers() {
		let cellA1 = SudokuCell(name: "A1")
		let cellB1 = SudokuCell(name: "B1")
		
		cellA1.addUnit([cellB1])
		XCTAssertTrue(cellA1.peers.containsObject(cellB1))
		
		let cellB2 = SudokuCell(name: "B2")
		let cellB3 = SudokuCell(name: "B3")
		
		cellA1.addUnit([cellB2, cellB3])
		XCTAssertTrue(cellA1.peers.containsObject(cellB2))
		XCTAssertTrue(cellA1.peers.containsObject(cellB3))

		XCTAssertFalse(cellA1.peers.containsObject(cellA1))
		XCTAssertFalse(cellB1.peers.containsObject(cellB1))
		XCTAssertFalse(cellB2.peers.containsObject(cellB2))
		XCTAssertFalse(cellB3.peers.containsObject(cellB3))
	}
}
