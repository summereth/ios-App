//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by 李茜 on 16/9/23.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    var bmiValue: Float!
    var advice: String!
    var color: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        resultLabel.text = String(format: "%.1f", bmiValue)
        view.backgroundColor = color
        adviceLabel.text = advice
    }
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
