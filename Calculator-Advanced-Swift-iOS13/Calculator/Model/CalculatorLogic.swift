//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by 李茜 on 10/12/23.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    private var intermediateCalculation: (num1: Double, calculation: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let num = number {
            switch symbol {
            case "+/-":
                return num * -1
            case "AC":
                // Clear previously stored number and operation
                intermediateCalculation = nil
                return 0
            case "%" :
                return num * 0.01
            case "=" :
                return performTwoNumCalculation(n2: num)
            default:
                intermediateCalculation = (num1: num, calculation: symbol)
            }
        }
        
        return nil
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
        
        if let n1 = intermediateCalculation?.num1,
           let operation = intermediateCalculation?.calculation {
            
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                return n2
                
            }
        }
        return nil
    }
    
}
