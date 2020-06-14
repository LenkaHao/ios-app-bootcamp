//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var calculator = CalculatorModel()
    var bmiValue = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let value = String(format: "%.2f", sender.value)
        heightLabel.text = "\(value)m"
    }
    
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let value = String(format: "%.0f", sender.value)
        weightLabel.text = "\(value)kg"
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        calculator.calculateBMI(height: heightSlider.value, weight: weightSlider.value)
        self.performSegue(withIdentifier: "goToResultView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != "goToResultView" {
            return
        }
        let destination = segue.destination as! ResultViewController
        destination.bmiValue = calculator.getBMIValue()
        destination.advice = calculator.getAdvice()
        destination.color = calculator.getColor()
    }
}

