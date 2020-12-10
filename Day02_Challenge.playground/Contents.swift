// ***********************
// *    Advent of Code   *
// *        Day 2        *
// * jpecsi | 12/10/2020 *
// ***********************



// Import
import Foundation


// Read input file ('passwords/policies')
let path = Bundle.main.path(forResource: "input", ofType: "txt")!
let line = try! String(contentsOfFile: path, encoding: String.Encoding.utf8)
var passwords = line.components(separatedBy: CharacterSet.newlines)

// Counter for valid passwords
var p1ValidPasswords = 0    // Part 1
var p2ValidPasswords = 0    // Part 2

// Loop through each line of passwords/policies
for p in passwords {
    
    // Split the line into three components
    let passwdEntry = p.components(separatedBy: " ")
    
    // Make sure there are no blank lines
    if (passwdEntry.count > 1) {
        
    
        // Extract data from the string
        let range=passwdEntry[0].components(separatedBy: "-")   // Get the range requirement and split
        let reqChar = passwdEntry[1].components(separatedBy: ":")   // Get the required character and split
        let password=passwdEntry[2] // Get the password

        let rangeMin: Int? = Int(range[0]) // Get the minimum (first) number
        let rangeMax: Int? = Int(range[1]) // Get the maximum (second) number
        
        
        
        // ====== PART 1 PASSWORD VALIDATION ====== //
        
        // Count the number of times the required character appears
        let passSplit = password.components(separatedBy: reqChar[0])
        let passCheck = passSplit.count-1
        
        // Check if the password is valid
        if (passCheck >= rangeMin!) && (passCheck <= rangeMax!){
            p1ValidPasswords+=1   // Increase the count
        }
        
        
        
        // ====== PART 2 PASSWORD VALIDATION ====== //
     
        // Get character positions and account for index (no 0)
        let pos1 = rangeMin!-1
        let pos2 = rangeMax!-1
        
        // Get the character at the positions
        let pos1char =  password[password.index(password.startIndex, offsetBy: pos1)]
        let pos2char =  password[password.index(password.startIndex, offsetBy: pos2)]
        
        // Check if character appears once and only once
        if ((pos1char == Character(reqChar[0]) && pos2char != Character(reqChar[0])) || (pos1char != Character(reqChar[0]) && pos2char == Character(reqChar[0]))) {
            p2ValidPasswords+=1
        }
        
    }

}

// Show total valid passwords
print("Part 1 Valid Passwords: \(p1ValidPasswords)")
print("Part 2 Valid Passwords: \(p2ValidPasswords)")




