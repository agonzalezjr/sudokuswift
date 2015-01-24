//
//  Array+Extension.swift
//  SudokuSwift
//
//  Created by Gonzalez, Andy on 1/23/15.
//
//

import Foundation

extension Array {

	func all(evaluateElement: (T) -> Bool) -> Bool {
		for element in self {
			if (!evaluateElement(element)) {
				return false
			}
		}
		return true
	}
	
	func any(evaluateElement: (T) -> Bool) -> Bool {
		for element in self {
			if (evaluateElement(element)) {
				return true
			}
		}
		return false
	}
}
