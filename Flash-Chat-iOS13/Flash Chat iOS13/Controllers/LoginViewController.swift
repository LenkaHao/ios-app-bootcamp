//
//  LoginViewController.swift
//  Flash Chat iOS13
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    

    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e.localizedDescription)
                    
                    let alert = UIAlertController(title: "Failed to login", message: e.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
                    self.present(alert, animated: true)
                } else {
                    self.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
            }
        }
    }
    
}
