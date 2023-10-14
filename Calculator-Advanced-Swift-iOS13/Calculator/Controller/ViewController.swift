//
//  ViewController.swift
//  Calculator
//
//  Created by 李茜 on 10/11/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTyping: Bool = true
    private var calculator = CalculatorLogic()
    
    private var displayValue: Double {
        
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Failure to convert display label text to Double!")
            }
            return number
        }
        
        set {
            
            //If the displayValue is int, displayLabel shouldn't display decimal places
            let isInt = floor(newValue) == newValue
            
            displayLabel.text = isInt ? String(Int(newValue)) : String(newValue)
        }
    }
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed

        if sender.currentTitle != "+/-" {
            isFinishedTyping = true // When calMethod == "+/-", users can still type numbers and this shouldn't be set to true
        }
        
        if let calMethod = sender.currentTitle {
            
            calculator.setNumber(displayValue)
            
            if let result = calculator.calculate(symbol: calMethod) {
                displayValue = result
            }
            
        }
    
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        
        if let num = sender.currentTitle {
            
            if isFinishedTyping {
        
                displayLabel.text = num == "." ? "0." : num
                isFinishedTyping = false
                
            } else {
                
                // The second '.' will be invalid and doesn't do anything at all
                if num == "." && displayLabel.text!.contains(".") {
                    return
                }
                
                displayLabel.text = displayLabel.text! + num
            }
            
        }
    
    }

}

