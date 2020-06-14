//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Lenka Hao on 6/14/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    
    var totalValue: String?
    var splitNumber: Int?
    var tipPercent: Double?

    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = totalValue
        settingLabel.text = "Split between \(splitNumber!) people, with \(tipPercent! * 100)% tip."
    }
    
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
