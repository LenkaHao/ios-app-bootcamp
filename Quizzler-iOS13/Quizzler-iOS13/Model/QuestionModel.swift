//
//  QuestionModel.swift
//  Quizzler-iOS13
//
//  Created by Lenka Hao on 6/6/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct QuestionModel {
    let questions = [
        Question("A slug's blood is green.", "True"),
        Question("Approximately one quarter of human bones are in the feet.", "True"),
        Question("The total surface area of two human lungs is approximately 70 square metres.", "True"),
        Question("In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", "True"),
        Question("It is illegal to pee in the Ocean in Portugal.", "True"),
        Question("You can lead a cow down stairs but not up stairs.", "False"),
        Question("Google was originally called 'Backrub'.", "True"),
        Question("Buzz Aldrin's mother's maiden name was 'Moon'.", "True"),
        Question("The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", "False"),
        Question("No piece of square dry paper can be folded in half more than 7 times.", "False"),
        Question("Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", "True")

    ]
    
    var questionIdx: Int = 0
    var score: Int = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == questions[questionIdx].answer {
            score += 1
            return true
        }
        return false
    }
    
    func getProgress() -> Float {
        return Float(questionIdx + 1) / Float(questions.count)
    }
    
    func getQuestion() -> String{
        return questions[questionIdx].question
    }
    
    mutating func nextQuestion() {
        questionIdx = (questionIdx + 1) % questions.count
        if questionIdx == 1 {
            score = 0
        }
    }
}
