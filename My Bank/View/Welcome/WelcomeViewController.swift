//
//  WelcomeViewController.swift
//  My Bank
//
//  Created by Mousa on 01.06.21.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        let loginViewController = LoginViewController(nibName: "\(LoginViewController.self)", bundle: nil)
        loginViewController.modalPresentationStyle = .fullScreen
        present(loginViewController, animated: true, completion: nil)

    }
}
