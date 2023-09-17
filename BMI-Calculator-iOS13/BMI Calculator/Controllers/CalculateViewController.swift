//
//  ViewController.swift
//  BMI Calculator
//
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var calculatorBrain = CalculatorBrian()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightChanged(_ sender: UISlider) {
        heightLabel.text = "\(String(format:"%.2f", sender.value))m"
    }
    
    @IBAction func weightChanged(_ sender: UISlider) {
        weightLabel.text = "\(String(format:"%.0f", sender.value))kg" // It's not accurate. But it's ok as long as we use the weight which user's acknowledged
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {

        calculatorBrain.calculateBMI(weight: Int(weightSlider.value), height: heightSlider.value)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let resultVC = segue.destination as! ResultViewController
            resultVC.bmiValue = calculatorBrain.getBMIValue()
            resultVC.advice = calculatorBrain.getBMIAdvice()
            resultVC.color = calculatorBrain.getBMIColor()
        }
    }
}

