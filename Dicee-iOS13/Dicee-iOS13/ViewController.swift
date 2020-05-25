//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    let images = ["One", "Two", "Three", "Four", "Five", "Six"]
    let diceCount = 2
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        let imgSelected = getRandomDice()
        diceImageView1.image = UIImage(named: "Dice\(imgSelected[0])")
        diceImageView2.image = UIImage(named: "Dice\(imgSelected[1])")
    }
    
    func getRandomDice() -> [String]{
        var result: [String] = []
        for _ in 1...self.diceCount {
            result.append(self.images[Int.random(in: 0..<self.images.count)])
        }
        return result
    }
    
    
}

