//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextLabel: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipPct: Float = 0.1
    var splitNum: Int = 2
    var billVal: Float = 0.0
    var total: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextLabel.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        let tipStr = sender.currentTitle!
        let endOfTipValue = tipStr.firstIndex(of: "%")!
        tipPct = Float(tipStr[..<endOfTipValue])! / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        splitNum = Int(sender.value)
    }
    
    @IBAction func calculateButtonPressed(_ sender: Any) {
        billVal = Float(billTextLabel.text ?? "0")!
        total = round((billVal * (1 + tipPct) / Float(splitNum)) * 100) / 100
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let resultVC = segue.destination as! ResultsViewController
            resultVC.total = total
            resultVC.tipPct = Int(tipPct * 100)
            resultVC.splitNum = splitNum
        }
    }
}

