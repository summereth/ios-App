//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by 李茜 on 17/9/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var total: Float?
    var tipPct: Int?
    var splitNum: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = String(total ?? 0.0)
        settingsLabel.text = "Split between \(splitNum ?? 2) people, with \(tipPct ?? 10)% tip."
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
