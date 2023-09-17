//
//  BMI.swift
//  BMI Calculator
//
//  Created by 李茜 on 16/9/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

struct BMI {
    let value: Float
    let advice: String
    let color: UIColor
    
    init(value: Float) {
        self.value = value
        if value < 18.5 {
            self.advice = "Eat more pies!"
            self.color = UIColor.blue
        } else if value < 24.9 {
            self.advice = "Fit as fiddle!"
            self.color = UIColor.green
        } else {
            self.advice = "Eat less pies!"
            self.color = UIColor.systemPink
        }
    }
}
