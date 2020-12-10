// ***********************
// *    Advent of Code   *
// *        Day 1        *
// * jpecsi | 12/10/2020 *
// ***********************



// Import
import Foundation


// Read input file ('expense report')
let path = Bundle.main.path(forResource: "input", ofType: "txt")!
let line = try! String(contentsOfFile: path, encoding: String.Encoding.utf8)
let expenses = line.components(separatedBy: CharacterSet.newlines)

// Setup variables/flags
let totalExpenses = expenses.count  // Total number of expense items
var firstNum = 0    // First number/base number
var secondNum = 0   // Number to be added to first number


// Loop through the expenses
for (index, element) in expenses.enumerated() {
    
    // Get the current expense & index in Int format
    let currentExpense: Int? = Int(element)
    let currentIndex: Int? = Int(index)
    
    // Unwrap index and expense
    if let i = currentIndex{
        if let e = currentExpense{
        
            // Find remaining numbers in array so that we always add the next numbers (instead of all in the array)
            let remain = totalExpenses-(i+1)
            
            // Loop through the remaining expenses
            for r in 1...remain {
                
                // Get the next expense and unwrap
                let nextExpense: Int? = Int(expenses[r])
                if let n = nextExpense{
                    
                    // Calculate sum and see if it equals 2020
                    if (e+n) == 2020{
                        firstNum = e
                        secondNum = n

                    }
                }
            }
        }
    }
}

print("SUM: \(firstNum) + \(secondNum) = \(firstNum+secondNum)")
print("MULT: \(firstNum) * \(secondNum) = \(firstNum*secondNum)")
