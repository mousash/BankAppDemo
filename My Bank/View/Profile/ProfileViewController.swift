//
//  ProfileViewController.swift
//  My Bank
//
//  Created by Mousa on 24.06.21.
//

import UIKit
import SwiftUI

class ProfileViewController: UIViewController {

//    @IBOutlet weak var backgroundProfileImage: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subNameLabel: UILabel!
    @IBOutlet weak var personalView: UIView!
    @IBOutlet weak var changePasscodeView: UIView!
    @IBOutlet weak var privacyView: UIView!
    @IBOutlet weak var faceIDView: UIView!
    @IBOutlet weak var closeAccountView: UIView!
    @IBOutlet weak var logoutView: UIView!
    @IBOutlet weak var securityGroupView: UIView!
    @IBOutlet weak var closeAccountGroupView: UIView!
    @IBOutlet weak var faceIDSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setDetailView(view: personalView, icon: "profile", text: "Personal details")
        setDetailView(view: changePasscodeView, icon: "key2", text: "Change passcode")
        setDetailView(view: privacyView, icon: "lock", text: "Privacy")
        setDetailView(view: faceIDView, icon: "faceID", text: "Sign in with Face ID")
        setDetailView(view: closeAccountView, icon: "heartBroken", text: "Close account")
        setDetailView(view: logoutView, icon: "logout", text: "logout")
        
    }
    
    private func setupUI() {
        profileImage.layer.masksToBounds = false
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.clipsToBounds = true
        profileImage.layer.borderWidth = 5
        profileImage.layer.borderColor = UIColor.white.cgColor
        
        makeCornerradiusToView(view: personalView)
        makeCornerradiusToView(view: securityGroupView)
        makeCornerradiusToView(view: closeAccountGroupView)
        
        
        nameLabel.text = "Mousa Amin Sharifi"
        subNameLabel.text = "iOS Developer"
        
        faceIDSwitch.onTintColor = UIColor(named: Assets.Colors.accentRed)
    }
    
    private func setDetailView(view: UIView, icon: String, text: String) {
        let child = UIHostingController(rootView: IconTextHorizentalView(icon: icon, text: text))
        child.view.translatesAutoresizingMaskIntoConstraints = false
        child.view.frame = view.bounds
        view.addSubview(child.view)
        
    }
    
    private func makeCornerradiusToView(view: UIView) {
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
    }
}
