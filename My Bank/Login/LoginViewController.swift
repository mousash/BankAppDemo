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
        let vc = TabBarViewController()

        vc.viewControllers = [
            self.viewController(with: "home", view: WelcomeViewController()),
            self.viewController(with: "cards", view: HomeViewController()),
            self.viewController(with: "stats", view: LoginViewController()),
            self.viewController(with: "profile", view: HomeViewController()),
        ]
        vc.selectedTab = 0
        vc.tabbarHeight = 40

        present(vc, animated: true, completion: nil)
    }
    
    private func viewController(with name: String, view: UIViewController) -> UIViewController {
        view.title = name
        return view
    }
}
