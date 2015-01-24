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
				//** These are all the same closure in more and more concise form
				// return self.cells.all( { c in return c.isSolved() } )
				// return self.cells.all( { c in c.isSolved() } )
				return self.cells.all({$0.isSolved})
			}
			return self.cachedIsSolved
		}
	}

	// MARK: Private properties
	
	private var cachedIsSolved: Bool
	
	// MARK: Initializer

	//** Initializer delegation!
	convenience init() {
		self.init(initialState:nil)
	}
	
	init(initialState: String?) {
		self.DIGITS = "123456789"
		self.ROWS = "ABCDEFGHI"
		self.COLUMNS = self.DIGITS
		
		// 9x9 dots
		self.EMPTY_BOARD = String(count: countElements(self.ROWS) * countElements(self.COLUMNS),
								  repeatedValue: Character("."))
		
		
		//** Forced Unwrapping
		// self.initialState = initialState != nil ? initialState! : self.EMPTY_BOARD
		
		//** Optional Binding
		if let validInitialState = initialState {
			self.initialState = validInitialState
			if (countElements(validInitialState) != countElements(self.ROWS) * countElements(self.COLUMNS)) {
				//** Can't call assert with the condition above or it complains 
				//** about sole properties not being initialized already
				assert(false)
			}
		} else {
			self.initialState = self.EMPTY_BOARD
		}

		// Create the cells
		self.cells = []
		for r in self.ROWS {
			for c in self.COLUMNS {
				self.cells.append(SudokuCell(name: String(r) + String(c)))
			}
		}
		
		// TODO:
		// Create the units of the board
		
		// TODO:
		// Let each cell know of the units it belongs to.
		// (from this, they will figure out their peers)

		// Cache this so once we find a solution we don't have to
		// check all cells anymore to determine the same answer
		self.cachedIsSolved = false
	}
	
	// MARK: Printing the puzzle
	
	
	
	// MARK: Solving the puzzle
	
	/**
		Actually solve the puzzle.
 
		Uses the information in the initial_state and it first assigns constraints
		and if needed search is performed recursively after that.
	
		:returns: False if the puzzle is impossible
	*/
	func solve() -> Bool {
		// TODO:
		return false
	}
}
