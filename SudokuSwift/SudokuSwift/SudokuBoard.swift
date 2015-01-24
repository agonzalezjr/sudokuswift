//
//  SudokuBoard.swift
//  SudokuSwift
//
//  Created by Gonzalez, Andy on 1/22/15.
//
//

import Foundation

/// A Sudoku board
class SudokuBoard {
	
	// MARK: Constants
	
	let DIGITS: String
	let ROWS: String
	let COLUMNS: String
	let EMPTY_BOARD: String
	
	// MARK: Properties
	
	let initialState: String
	
	private(set) var cells: Array<SudokuCell>
	
	/// Return true if the puzzle is solved
	var isSolved: Bool {
		get {
			if (!self.cachedIsSolved) {
				return false
			}
			return self.cachedIsSolved
		}
	}

	// MARK: Private properties
	
	private var cachedIsSolved: Bool
	
	// MARK: Initializer

	init() {
		self.DIGITS = "123456789"
		self.ROWS = "ABCDEFGHI"
		self.COLUMNS = self.DIGITS
		
		// 9x9 dots
		self.EMPTY_BOARD = String(count: countElements(ROWS) * countElements(COLUMNS),
								  repeatedValue: Character("."))
		
		self.cells = [SudokuCell(name:"A1")]
		
		self.initialState = self.EMPTY_BOARD

		//** These are all the same closure in more and more concise form
		// self.cachedIsSolved = self.cells.all( { c in return c.isSolved() } )
		// self.cachedIsSolved = self.cells.all( { c in c.isSolved() } )
		self.cachedIsSolved = self.cells.all({$0.isSolved})

	}
	
	/**
		Actually solve the puzzle.
 
		Uses the information in the initial_state and it first assigns constraints
		and if needed search is performed recursively after that.
	
		:returns: False if the puzzle is impossible
	*/
	func solve() -> Bool {
		// TODO
		return false
	}
}
