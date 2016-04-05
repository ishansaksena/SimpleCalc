//
//  main.swift
//  SimpleCalc
//
//  Created by ishansaksena on 4/2/16.
//  Copyright © 2016 ishansaksena. All rights reserved.
//

import Foundation

// Calculates the final result
func result(n: [Int], oper: String) -> Int {
    switch(oper) {
    case "+": return n[0] + n[1];
    case "-": return n[0] - n[1];
    case "*": return n[0] * n[1];
    case "/": return n[0] / n[1];
    case "count": return n.count;
    case "avg": return sum(n) / n.count;
    case "fact": return fact(n[0]);
    default: return -1;
    }
}

// Returns true if the String is a number
func isNumber(oper: String) -> Bool {
    switch(oper) {
    case "+": return false;
    case "-": return false;
    case "*": return false;
    case "/": return false;
    case "count": return false;
    case "avg": return false;
    case "fact": return false;

    // It is a number
    default: return true;
    }
}

// Returns the number of elements in the arra
func sum(numbers: [Int]) -> Int {
    var n = 0
    for number in numbers {
        n += number
    }
    return n
}

// Returns the factorial of the number passed in
func fact(number: Int) -> Int {
    if (number == 0) {
        return 1
    }
    var r = 1
    for n in 1...number {
        r *= n
    }
    return r
}

print("Enter an expression separated by returns")

var current = "1"
var numbers = [Int]()
var oper = ""
repeat {
    current = readLine(stripNewline: true)!
    // Add to the array if it is a number
    if(isNumber(current)) {
        numbers.append(Int.init(current)!)
    } else {// Update the operand
        oper = current
    }
} while(isNumber(current))

// Get one last number if it's one of the binary operations
if (oper == "+" || oper == "-" || oper == "*" || oper == "/") {
    numbers.append(Int.init(readLine(stripNewline: true)!)!)
}
//Testing only
//print("The array is \(numbers) and the operation is \(oper)")
print(result(numbers, oper: oper))

