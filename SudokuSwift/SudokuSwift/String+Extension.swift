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
}
