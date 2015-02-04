//
//  String+Extension.swift
//  SudokuSwift
//
//  Created by Gonzalez, Andy on 1/27/15.
//
//

extension String {
	
	subscript (i: Int) -> Character {
		// TODO: Add error handling to this ... maybe return a Character?
		return self[advance(self.startIndex, i)]
	}
	
	subscript (i: Int) -> String {
		// TODO: Add error handling to this ... maybe return a String?
		return String(self[i] as Character)
	}
	
	subscript (r: Range<Int>) -> String {
		// TODO: Add error handling to this ... maybe return a Character?
		return substringWithRange(Range(start: advance(startIndex, r.startIndex), end: advance(startIndex, r.endIndex)))
	}
	
	func index(substring: String) -> Int {
		// TODO: Add error handling to this ... maybe return a Int? or play with iterators some more
		let range = self.rangeOfString(substring)
		return distance(self.startIndex, range!.startIndex)
	}
	
	public func ljust(width: Int, _ fillchar: Character = " ") -> String {
		let length = countElements(self)
		if length >= width {
			return self
		}
		return self + String(count: width - length, repeatedValue: fillchar)
	}
	
	public func rjust(width: Int, _ fillchar: Character = " ") -> String {
		let length = countElements(self)
		if length >= width {
			return self
		}
		return String(count: width - length, repeatedValue: fillchar) + self
	}
	
	public func center(width: Int, _ fillchar: Character = " ") -> String {
		let length = countElements(self)
		let oddShift = length % 2 == 1 ? 0.5 : 0.0 // Python is weird about string centering
		let left = Int((Double(width) + Double(length)) / 2.0 + oddShift)
		return self.ljust(left, fillchar).rjust(width, fillchar)
	}
}
