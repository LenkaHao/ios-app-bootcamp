//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    let storyModel = StoryBrain()
    var optionSelected = 0
    var storySelected: Story? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storySelected = storyModel.getStoryById(optionSelected)
        updateUI(storySelected)
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        if sender == choice1Button {
            optionSelected = storySelected!.dest1
        } else {
            optionSelected = storySelected!.dest2
        }
        
        storySelected = storyModel.getStoryById(optionSelected)
        updateUI(storySelected)
    }
    
    func updateUI(_ story: Story?) {
        guard let story = story else {return}
        
        storyLabel.text = story.title
        choice1Button.setTitle(story.option1, for: UIControl.State.normal)
        choice2Button.setTitle(story.option2, for: UIControl.State.normal)
    }
    
}

