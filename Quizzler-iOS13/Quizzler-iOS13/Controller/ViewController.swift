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
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
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
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        updateScore()
        
        progressBar.progress = questionModel.getProgress()
        questionLabel.text = questionModel.getQuestion()
        questionModel.nextQuestion()
    }
    
    func updateScore() {
        scoreLabel.text = "Score: \(questionModel.score)"
    }
}

