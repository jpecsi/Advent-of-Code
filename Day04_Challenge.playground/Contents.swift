// ***********************
// *    Advent of Code   *
// *        Day 3        *
// * jpecsi | 12/14/2020 *
// ***********************

// Import
import Foundation

//======== EXTENSIONS ========//
extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

//======== FUNCTIONS ========//

// Read input file function
func loadInputData(n: String, t: String) -> Array<String>{
    let path = Bundle.main.path(forResource: n, ofType: t)!
    let line = try! String(contentsOfFile: path, encoding: String.Encoding.utf8)
    return (line.components(separatedBy: CharacterSet.newlines))
}
