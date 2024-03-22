//
//  ViewController.swift
//  swiftbookAppStudyHW2.3
//
//  Created by MacOS on 21.03.2024.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let username = "Mister"
    let password = "twister"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.username = usernameTextField.text
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            loginButtonPressed()
            performSegue(withIdentifier: "welcome", sender: self)
        }
        
        return true
    }
    
    @IBAction func loginButtonPressed() {
        guard usernameTextField.text == username && passwordTextField.text == password else {
            let alert = UIAlertController(title: "Error!", message: "Wrong password or username. Try again.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            
            present(alert, animated: true)
            
            passwordTextField.text = ""
            
            return
        }
    }
    
    @IBAction func remindInfoPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Listen!", message: "Your required info is: ", preferredStyle: .alert)
        
        if sender.tag == 0 {
            alert.message?.append(username)
        } else {
            alert.message?.append(password)
        }
        
        alert.addAction(UIAlertAction(title: "Got it!", style: .default))
        
        present(alert, animated: true)
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
}
