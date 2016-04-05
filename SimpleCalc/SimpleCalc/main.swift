//
//  main.swift
//  SimpleCalc
//
//  Created by ishansaksena on 4/2/16.
//  Copyright © 2016 ishansaksena. All rights reserved.
//
//  With extra credit option #1 implemented 

import Foundation

// Calculates the final result
func result(n: [Double], oper: String) -> Double {
    switch(oper) {
    case "+": return n[0] + n[1];
    case "-": return n[0] - n[1];
    case "*": return n[0] * n[1];
    case "/": return n[0] / n[1];
    case "count": return Double(n.count);
    case "avg": return sum(n) / Double(n.count);
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
func sum(numbers: [Double]) -> Double {
    var n = 0.0
    for number in numbers {
        n += number
    }
    return n
}

// Returns the factorial of the number passed in
func fact(number: Double) -> Double {
    if (number == 0) {
        return 1
    }
    var r = 1.0
    for n in 1...Int(number) {
        r *= Double(n)
    }
    return r
}

print("Enter an expression separated by returns")

var current = "1"
var numbers = [Double]()
var oper = ""
repeat {
    current = readLine(stripNewline: true)!
    // Add to the array if it is a number
    if(isNumber(current)) {
        numbers.append(Double.init(current)!)
    } else {// Update the operand
        oper = current
    }
} while(isNumber(current))

// Get one last number if it's one of the binary operations
if (oper == "+" || oper == "-" || oper == "*" || oper == "/") {
    numbers.append(Double.init(readLine(stripNewline: true)!)!)
}
//Testing only
//print("The array is \(numbers) and the operation is \(oper)")
print(result(numbers, oper: oper))

