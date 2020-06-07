//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Lenka Hao on 6/6/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let question: String
    let options: [String]
    let answer: String
    
    init(_ question: String, _ options: [String], _ answer: String) {
        self.question = question
        self.options = options
        self.answer = answer
    }
}
