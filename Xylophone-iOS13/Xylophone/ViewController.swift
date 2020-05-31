//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func keyPressed(_ sender: UIButton) {
        playSound(sender.currentTitle!)
        sender.alpha = 0.5
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.2, execute: {sender.alpha = 1})
        
    }
    
    func playSound(_ label: String) {
        guard let url = Bundle.main.url(forResource: label, withExtension: "wav") else {return}
        player = try? AVAudioPlayer(contentsOf: url)
        guard let player = player else {return}
        player.play()
    }
    
    

    

}

