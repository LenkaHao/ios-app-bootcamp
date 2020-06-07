//
//  QuestionModel.swift
//  Quizzler-iOS13
//
//  Created by Lenka Hao on 6/6/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct QuestionModel {
//    let questions = [
//        Question("A slug's blood is green.", ["True", "False"], "True"),
//        Question("Approximately one quarter of human bones are in the feet.", ["True", "False"], "True"),
//        Question("The total surface area of two human lungs is approximately 70 square metres.", ["True", "False"], "True"),
//        Question("In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", ["True", "False"], "True"),
//        Question("It is illegal to pee in the Ocean in Portugal.", ["True", "False"], "True"),
//        Question("You can lead a cow down stairs but not up stairs.", ["True", "False"], "False"),
//        Question("Google was originally called 'Backrub'.", ["True", "False"], "True"),
//        Question("Buzz Aldrin's mother's maiden name was 'Moon'.", ["True", "False"], "True"),
//        Question("The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", ["True", "False"], "False"),
//        Question("No piece of square dry paper can be folded in half more than 7 times.", ["True", "False"], "False"),
//        Question("Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", ["True", "False"], "True")
//
//    ]
    
    let questions = [
        Question("Which is the largest organ in the human body?", ["Heart", "Skin", "Large Intestine"], "Skin"),
        Question("Five dollars is worth how many nickels?", ["25", "50", "100"], "100"),
        Question("What do the letters in the GMT time zone stand for?", ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], "Greenwich Mean Time"),
        Question("What is the French word for 'hat'?", ["Chapeau", "Écharpe", "Bonnet"], "Chapeau"),
        Question("In past times, what would a gentleman keep in his fob pocket?", ["Notebook", "Handkerchief", "Watch"], "Watch"),
        Question("How would one say goodbye in Spanish?", ["Au Revoir", "Adiós", "Salir"], "Adiós"),
        Question("Which of these colours is NOT featured in the logo for Google?", ["Green", "Orange", "Blue"], "Orange"),
        Question("What alcoholic drink is made from molasses?", ["Rum", "Whisky", "Gin"], "Rum"),
        Question("What type of animal was Harambe?", ["Panda", "Gorilla", "Crocodile"], "Gorilla"),
        Question("Where is Tasmania located?", ["Indonesia", "Australia", "Scotland"], "Australia")
    ]
    
    var questionIdx: Int = -1
    var score: Int = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        print(userAnswer)
        print(questions[questionIdx].answer)
        if userAnswer == questions[questionIdx].answer {
            score += 1
            return true
        }
        return false
    }
    
    func getProgress() -> Float {
        return Float(questionIdx + 1) / Float(questions.count)
    }
    
    func getOptions() -> [String] {
        return questions[questionIdx].options
    }
    
    func getQuestion() -> String{
        return questions[questionIdx].question
    }
    
    mutating func nextQuestion() {
        questionIdx = (questionIdx + 1) % questions.count
        if questionIdx == 0 {
            score = 0
        }
    }
}
