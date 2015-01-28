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
		
		// 9x9 - all dots
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
		
		// Cache this so once we find a solution we don't have to
		// check all cells anymore to determine the same answer
		self.cachedIsSolved = false
		
		// Create the board's units
		let unitsList = self.getUnitsList()
		
		// Let each cell know of the units it belongs to.
		// (from this, they will figure out their peers)
		for cell in self.cells {
			for unit in unitsList {
				if contains(unit, cell) {
					cell.addUnit(unit)
				}
			}
		}
	}
	
	// MARK: Printing the puzzle
	
	func getCellByName(name: String) -> SudokuCell? {
		if countElements(name) != 2 {
			return nil
		}
		
		if !contains(self.ROWS, name[0]) {
			return nil
		}

		if !contains(self.COLUMNS, name[1]) {
			return nil
		}
		
		let r = self.ROWS.index(name[0]);
		let c = self.COLUMNS.index(name[1]);
		
		return self.cells[self.ROWS.index(name[0]) * 9 + self.COLUMNS.index(name[1])];
	}
	
	
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
	
	// MARK: Private methods
	
	// Returns an array of all the units in the board. 
	//
	// These are the groups of 9 cells that must contain unique values
	// (all rows, all columns, and all 3x3 groupings, so there is 27 of
	// these)
	private func getUnitsList() -> Array<Array<SudokuCell>> {
		var unitsList: Array<Array<SudokuCell>> = []
		
		// Each row is a unit
		for c in self.COLUMNS {
			var thisUnit: Array<SudokuCell> = []
			for r in self.ROWS {
				thisUnit.append(self.getCellByName(String(r) + String(c))!)
			}
			unitsList.append(thisUnit)
		}
		
		// then the columns
		for r in self.ROWS {
			var thisUnit: Array<SudokuCell> = []
			for c in self.COLUMNS {
				thisUnit.append(self.getCellByName(String(r) + String(c))!)
			}
			unitsList.append(thisUnit)
		}
		
		// then the big squares
		for rs in ["ABC", "DEF", "GHI"] {
			for cs in ["123", "456", "789"] {
				var thisUnit: Array<SudokuCell> = []
				for r in rs {
					for c in cs {
						thisUnit.append(self.getCellByName(String(r) + String(c))!)
					}
				}
				unitsList.append(thisUnit)
			}
		}
		
		return unitsList;
	}
}
