//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by 李茜 on 16/9/23.
//

import UIKit

struct CalculatorBrian {

    var bmi: BMI?
    
    mutating func calculateBMI(weight: Int, height: Float) {
        let bmiValue = Float(weight) / pow(height, 2)
        bmi = BMI(value: bmiValue)
    }
    
    func getBMIValue() -> Float {
        return bmi?.value ?? 0.0
    }
    
    func getBMIAdvice() -> String {
        return bmi?.advice ?? ""
    }
    
    func getBMIColor() -> UIColor {
        return bmi?.color ?? UIColor.green
    }
}
