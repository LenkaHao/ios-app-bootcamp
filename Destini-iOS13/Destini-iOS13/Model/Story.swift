//
//  Sotry.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct Story {
    let id: Int
    let title: String
    let option1: String
    let option2: String
    let dest1: Int
    let dest2: Int
    
    init(_ id: Int, _ title: String, _ option1: String, _ option2: String, _ dest1: Int, _ dest2: Int) {
        self.id = id
        self.title = title
        self.option1 = option1
        self.option2 = option2
        self.dest1 = dest1
        self.dest2 = dest2
    }
}
