//: Playground - noun: a place where people can play

import UIKit


/*
 https://github.com/garora/TDD-Katas#mine-fields-
 https://acm.uva.es/p/v101/10189.html
 A field of N x M squares is represented by N lines of
 exactly M characters each. The character '*' represents
 a mine and the character '.' represents no-mine.
 
 Example input (a 4 x 3 mine-field of 12 squares, 2 of
 which are mines)
 
 4 3
 *...
 ..*.
 ....
 
 Your task is to write a program to accept this input and
 produce as output a hint-field of identical dimensions
 where each square is a * for a mine or the number of
 adjacent mine-squares if the square does not contain a mine.
 
 Example output (for the above input)
 *211
 12*1
 0111
 
 I'm just using regular arrays, will parse the string later.
 */

func produceHintField(input:[[String]]) -> [[String]] {
    var returnValue:[[String]] = []
    for (index, row) in input.enumerated() {
        returnValue.append([String]())
        for (index2, column) in row.enumerated() {
            returnValue[index].append(isMine(input: column) ? "*" : calculateMinesNearby(row: index, column: index2, input: input))
        }
    }
    
    return returnValue
}

func calculateMinesNearby(row:Int, column:Int, input:[[String]])->String {
    var minesNearby = 0
    let rowStart = clamp(value: row - 1, high: input.count-1)
    let rowEnd = clamp(value: row + 1, high: input.count-1)
    let columnStart = clamp(value: column - 1, high: input[0].count-1)
    let columnEnd = clamp(value: column + 1, high: input[0].count-1)
    
    for currentRow in rowStart...rowEnd {
        for currentColumn in columnStart...columnEnd {
            if currentRow == row && currentColumn == column { continue }
            if isMine(input: input[currentRow][currentColumn]) { minesNearby += 1 }
        }
    }
    return String(minesNearby)
}

func isMine(input:String)->Bool {
    return input == "*"
}

func clamp(value:Int, low:Int = 0, high:Int)->Int {
    return min(max(value, low), high)
}


/*
 Test Cases:
 *...
 ....
 .*..
 ....
 
 **...
 .....
 .*...

 */

var testData = [["*", ".", ".", "."],
                [".", ".", ".", "."],
                [".", ".", "*", "."],
                [".", ".", ".", "."]]
print(produceHintField(input: testData))
/*[["*", "1", "0", "0"], 
   ["1", "2", "1", "1"], 
   ["0", "1", "*", "1"], 
   ["0", "1", "1", "1"]] */

testData = [["*", "*", ".", ".", "."],
            [".", ".", ".", ".", "."],
            [".", "*", ".", ".", "."]]
print(produceHintField(input: testData))
/*
[["*", "*", "1", "0", "0"], 
 ["3", "3", "2", "0", "0"],
 ["1", "*", "1", "0", "0"]]
 */

testData = [[]]
print(produceHintField(input: testData))
