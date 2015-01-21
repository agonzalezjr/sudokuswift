//
//  SudokuCell.swift
//  SudokuSwift
//
//  Created by Gonzalez, Andy on 1/20/15.
//
//

import Foundation

class SudokuCell
{
	// MARK: Properties
	
	// Row-Column name of the cell (e.g. A1, C7, etc...)
	let name: String
	
	// MARK: Constructor
	
	init(name: String)
	{
		self.name = name
	}
}
