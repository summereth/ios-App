//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    var totalTime = 0
    var timePassed = 0
    let eggTimes = ["Soft": 3, "Medium": 5, "Hard": 7]
    var timer = Timer()
    var player: AVAudioPlayer!
    let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")


    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        timePassed = 0
        progressBar.progress = 0.0
        
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter() {
        if timePassed < totalTime {
            timePassed += 1
            progressBar.progress = Float(timePassed) / Float(totalTime)
            
        } else {
            timer.invalidate()
            titleLabel.text = "Done!"
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
}
