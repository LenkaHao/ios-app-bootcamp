//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    
    var questionModel = QuestionModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateScore()
        updateQuestion()
    }


    @IBAction func answerButtonPressed(_ sender: UIButton) {
        if questionModel.checkAnswer(sender.currentTitle!) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.4, execute: updateQuestion)
    }
    
    func updateQuestion() {
        questionModel.nextQuestion()
        
        firstButton.backgroundColor = UIColor.clear
        secondButton.backgroundColor = UIColor.clear
        thirdButton.backgroundColor = UIColor.clear
        updateScore()
        
        progressBar.progress = questionModel.getProgress()
        questionLabel.text = questionModel.getQuestion()
        let options = questionModel.getOptions()
        firstButton.setTitle(options[0], for: UIControl.State.normal)
        secondButton.setTitle(options[1], for: UIControl.State.normal)
        thirdButton.setTitle(options[2], for: UIControl.State.normal)    
    }
    
    func updateScore() {
        scoreLabel.text = "Score: \(questionModel.score)"
    }
}

