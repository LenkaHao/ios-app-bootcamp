//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//

// Test Account 1: 123@abc.com, testing
// Test Account 2: abc@abc.com, testing

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e.localizedDescription)
                    
                    let alert = UIAlertController(title: "Failed to register", message: e.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
                    self.present(alert, animated: true)
                } else {
                    let alert = UIAlertController(title: "Success!", message: "Let's chat", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Go", style: .default, handler: { action in
                        self.performSegue(withIdentifier: K.registerSegue, sender: self)
                    }))
                    self.present(alert, animated: true)
                }
            }
        }
    }
    
}
