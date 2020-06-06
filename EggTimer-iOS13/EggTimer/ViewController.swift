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
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let timeDict = ["Soft": 10, "Medium": 420, "Hard": 720]
    var timeRemaining = 0
    var timeTotal = 0
    var timer: Timer?
    var player: AVAudioPlayer?
    
    @IBAction func hardnessButtonPressed(_ sender: UIButton) {
        timer?.invalidate()
        
        let hardness = sender.currentTitle!
        timeRemaining = timeDict[hardness]!
        timeTotal = timeRemaining
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerElapsed), userInfo: nil, repeats: true)
        progressBar.progress = 0
        
    }
    
    @objc func timerElapsed() {
        if timeRemaining > 0 {
            print("Time remaining: \(timeRemaining) seconds")
            timeRemaining -= 1
            progressBar.progress = 1 - Float(timeRemaining) / Float(timeTotal)
        }
        else {
            timer?.invalidate()
            titleLabel.text = "Done!"
            playAlarm("alarm_sound")
        }
    }
    
    func playAlarm(_ label: String) {
        guard let url = Bundle.main.url(forResource: label, withExtension: "mp3") else {return}
        player = try? AVAudioPlayer(contentsOf: url)
        guard let player = player else {return}
        player.play()
    }
}
