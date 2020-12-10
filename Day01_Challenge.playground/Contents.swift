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
var p1firstNum = 0    // PART 1 First number/base number
var p1secondNum = 0   // PART 1 Number to be added to first number

var p2firstNum = 0    // PART 2 First number/base number
var p2secondNum = 0   // PART 2 Number to be added to first number
var p2thirdNum = 0    // PART 2 Number to be added to first/second numbers

print("Crunching the numbers...")

// Loop through the expenses
for (index, element) in expenses.enumerated() {
    
    // Get the current expense & index in Int format
    let currentExpense: Int? = Int(element)
    let currentIndex: Int? = Int(index)
    
    // Unwrap index and expense
    if let i = currentIndex{
        if let e = currentExpense{
        
            // Find remaining numbers in array so that we always add the next numbers (instead of all in the array)
         
            
            // Loop through the remaining expenses
            let start = i+1
            for r in start..<totalExpenses {
                
                // Get the next expense and unwrap
                let nextExpense: Int? = Int(expenses[r])
                if let n = nextExpense{
                    
                    // Calculate sum and see if it equals 2020
                    if (e+n) == 2020{
                        p1firstNum = e
                        p1secondNum = n
                    }
                    
                    // Loop through the next set of expenses to solve part 2
                    let final = r+1
                    for f in final..<totalExpenses{
                        let thirdExpense: Int? = Int(expenses[f])
                        if let t = thirdExpense{
                            if (e+n+t) == 2020{
                                p2firstNum = e
                                p2secondNum = n
                                p2thirdNum = t
                            }
                        }
                    }
                }
            }
        }
    }
}

// PART 1 RESULTS
print("[PART 1 RESULTS]")
print("SUM: \(p1firstNum) + \(p1secondNum) = \(p1firstNum+p1secondNum)")
print("PRODUCT: \(p1firstNum) * \(p1secondNum) = \(p1firstNum*p1secondNum)")

// PART 2 RESULTS
print("\n[PART 2 RESULTS]")
print("SUM: \(p2firstNum) + \(p2secondNum) + \(p2thirdNum) = \(p2firstNum+p2secondNum+p2thirdNum)")
print("PRODUCT: \(p2firstNum) * \(p2secondNum) * \(p2thirdNum) = \(p2firstNum*p2secondNum*p2thirdNum)")


