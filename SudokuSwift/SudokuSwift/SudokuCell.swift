//
//  SudokuCell.swift
//  SudokuSwift
//
//  Created by Gonzalez, Andy on 1/20/15.
//
//

import Foundation

class SudokuCell : Printable, DebugPrintable
{
	// MARK: Properties
	
	// Row-Column name of the cell (e.g. A1, C7, etc...)
	let name: String
	private(set) var values: String
	private(set) var peers: NSMutableSet
	private(set) var units: Array<Array<SudokuCell>>
	
	// These do not seem to be working
	var description: String {
		return self.name
	}
	var debugDescription: String {
		return self.name
	}
	
	// MARK: Constructor
	
	init(name: String, choices: Int = 9) {
		self.name = name
		self.values = "123456789"
		self.peers = NSMutableSet()
		self.units = []
	}
	
	func isSolved() -> Bool {
		return countElements(self.values) == 1
	}
	
	func addUnit(unit: Array<SudokuCell>) {
		self.units.append(unit)
		for (peer) in unit {
			self.peers.addObject(peer)
		}
	}
}
