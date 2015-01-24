//
//  SudokuCell.swift
//  SudokuSwift
//
//  Created by Gonzalez, Andy on 1/20/15.
//
//

import Foundation

/// A cell in a Sudoku puzzle board
class SudokuCell : Printable, DebugPrintable
{
	// MARK: Properties
	
	/// Row-Column name of the cell (e.g. A1, C7, etc...)
	let name: String
	
	/// Posible values of the cell
	private(set) var values: String
	
	/// A set with the peers of the cell
	private(set) var peers: NSMutableSet //** Obj-C bridging!
	
	/// An array with the units the cell belongs to
	private(set) var units: Array<Array<SudokuCell>>

	//** A computed (read-only) property
	/// True if the cell is solved
	var isSolved: Bool {
		return countElements(self.values) == 1
	}

	// MARK: Initializer
	
	init(name: String, choices: Int = 9) {
		self.name = name

		// string with value "1..choices"
		self.values = "".join((1...choices).map({String($0)})) //** We <3 closures!

		self.peers = NSMutableSet()
		self.units = []
	}
	
	/**
		Add units to this cell that the cell belongs to.
	
		It will take all of the cells in the units and add them as peers to the cell as well.
	
		:param: unit An array of cells that for a unit this cell belongs to.
	*/
	func addUnit(unit: Array<SudokuCell>) {
		self.units.append(unit)
		for (peer) in unit {
			self.peers.addObject(peer)
		}
	}
	
	// MARK: Solving the puzzle
	
	/**
		Eliminates a value from the possible values of this cell.
	
		After doing the elimination, it will checks the cell's units, and
		if the value just eliminated from this cell is now only possible in
		one cell in the whole unit,	it will assign it to that cell and so
		on recursively.

		:param: value The value to eliminate
		:returns: False if a contradiction is found
	*/
	func eliminate(value: String) -> Bool {
		assert(countElements(value) == 1)
		
		// Contradiction: can't eliminate the last value
		if self.values == value { //** parens are optional, braces are required!
			return false
		}
		
		// We already had this information, no need to propagate this further
		if (self.values.rangeOfString(value) == nil) {
			return true
		}
		
		// Eliminate!
		self.values = self.values.stringByReplacingOccurrencesOfString(value, withString: "")
		
		// TODO: The propagation ...
		
		return true
	}
	
	/**
		Assigns a value to a cell.
	
		It will then eliminate the assigned value from all of this
		cell's peers as well.

		:param: value The final value of the cell
		:returns: False if there is a contradiction
	*/
	func assign(value: String) -> Bool {
		assert(countElements(value) == 1)
		
		// Contradiction: Can't assign a value that's not a possibility!
		if (self.values.rangeOfString(value) == nil) {
			return false
		}
		
		// We already had this information, no need to propagate anything
		if (self.values == value) {
			return true
		}
		
		// Assign!
		self.values = value
		
		// TODO: The propagation ...
		
		return true
	}
	
	// MARK: Printable Protocols
	
	// These do not seem to be working
	var description: String {
		return self.name
	}
	var debugDescription: String {
		return self.name
	}
}
