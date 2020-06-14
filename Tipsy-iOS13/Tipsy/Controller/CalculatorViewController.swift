//
//  ViewController.swift
//  Tipsy
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var fifteenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var bill: Double?
    var tipPercent: Double?
    var splitNumber: Int?
    var result: Double?

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        sender.isSelected = true
        
        if sender == tenPercentButton {
            deselectButton(button: fifteenPercentButton)
            deselectButton(button: twentyPercentButton)
            self.tipPercent = 0.1
        }
        if sender == fifteenPercentButton {
            deselectButton(button: tenPercentButton)
            deselectButton(button: twentyPercentButton)
            self.tipPercent = 0.15
        }
        if sender == twentyPercentButton {
            deselectButton(button: tenPercentButton)
            deselectButton(button: fifteenPercentButton)
            self.tipPercent = 0.2
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        
        let value = Int(sender.value)
        splitNumberLabel.text = String(value)
        self.splitNumber = value
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        if let value = Double(billTextField.text!) {
            self.bill = value
        } else {
            self.bill = 0.0
        }
        
        self.result = bill! * (1 + tipPercent!) / Double(splitNumber!)        
        self.performSegue(withIdentifier: "goToResultView", sender: self)
    }
    
    func deselectButton(button: UIButton) {
        button.isSelected = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != "goToResultView" {
            return
        }
        
        let destination = segue.destination as! ResultViewController
        destination.splitNumber = self.splitNumber
        destination.tipPercent = self.tipPercent
        destination.totalValue = String(format: "%.2f", self.result!)
    }
}

