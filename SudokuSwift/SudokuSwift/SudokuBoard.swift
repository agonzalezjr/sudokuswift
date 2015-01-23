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
	let DIGITS: String
	let ROWS: String
	let COLUMNS: String
	let EMPTY_BOARD: String
	
	let initialState: String
	
	private(set) var isSolved: Bool { //** A computed property!
		get {
			return false
		}
		set {
			// TODO ...
		}
	}
	
	init() {
		self.DIGITS = "123456789"
		self.ROWS = "ABCDEFGHI"
		self.COLUMNS = self.DIGITS
		
		// 9x9 dots
		self.EMPTY_BOARD = String(count: countElements(ROWS) * countElements(COLUMNS),
								  repeatedValue: Character("."))
		
		self.initialState = self.EMPTY_BOARD
		self.isSolved = false
	}
	
}
