//
//  LoginViewController.swift
//  My Bank
//
//  Created by Mousa on 02.06.21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: AccentButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    private func viewSetup() {
        backgroundView.layer.cornerRadius = 20
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
    }
}
