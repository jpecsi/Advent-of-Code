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


// Check the path / count the trees
func countTrees(x: Int, y: Int, map: Array<String>) -> Int{
    // Variables
    var trees = 0       // Trees encountered
    var position = x    // Where to move
    var nextPos = y     // Set the first position
    let lineSize = 30   // Length of each line in the map
    let mapSize = (map.count-1) // Map size, (HACK: subtract 1 to account for empty last line)
    
    // Loop through the map
    for (i, e) in map.enumerated(){
        
        // Make sure we don't hit the end of the map
        if (i < mapSize){
            
            if (i == nextPos){

                // Account for the line length
                if (position > lineSize){
                    position = position-lineSize-1  // Map repeats across Y, so reset the position
                }
                
                // Increase the tree count if discovered
                if (e[position] == "#"){
                    trees+=1
                }
            
                // Update the position
                position+=x
                nextPos = i+y
            }
        }
    }
    
    // Return tree count
    return trees
}




//======== MAIN ========//
let data = loadInputData(n: "input", t: "txt")

// Challenge 1
//print("Total Trees Encountered: \(countTrees(x: 3, y: 1, map: data))")

// Challenge 2
let s1 = countTrees(x: 1, y: 1, map: data)
let s2 = countTrees(x: 3, y: 1, map: data)
let s3 = countTrees(x: 5, y: 1, map: data)
let s4 = countTrees(x: 7, y: 1, map: data)
let s5 = countTrees(x: 1, y: 2, map: data)

print("Trees on Slope 1: \(s1)")
print("Trees on Slope 2: \(s2)")
print("Trees on Slope 3: \(s3)")
print("Trees on Slope 4: \(s4)")
print("Trees on Slope 5: \(s5)")

print("Total Trees Encountered: \(s1*s2*s3*s4*s5)")


