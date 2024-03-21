//
//  WelcomeViewController.swift
//  swiftbookAppStudyHW2.3
//
//  Created by MacOS on 21.03.2024.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameLabel.text = username
    }
    
    @IBAction func logoutButtonPressed() {
        dismiss(animated: true)
    }
}
