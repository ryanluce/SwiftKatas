//: Playground - noun: a place where people can play

import UIKit


/*The Coin Change Kata exercise should produce the minimal amount of change for a given amount.
 
 For instance, If the input is: $0.99, the output should be: 3 quarters, 2 dimes, and 4 pennies.*/

func getChange(input:Int)->[Int] {
    var input = input
    var returnValue = [0,0,0,0]
    let coins = [25,10,5,1]
    for (index,value) in coins.enumerated() {
        if floor(Double(input/value)) > 0 {
            //ugly because of swift
            let howManyCoins = Int(floor(Double(input/value)))
            input -= howManyCoins * value
            returnValue[index] = howManyCoins
            
        }
    }
    
    return returnValue
}

getChange(input: 99)
getChange(input: -1)
getChange(input: 150)
getChange(input: 1)
