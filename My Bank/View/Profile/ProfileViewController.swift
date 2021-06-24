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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setDetailView(view: personalView, icon: "profile", text: "Personal details")
        setDetailView(view: changePasscodeView, icon: "profile", text: "Personal details")
        setDetailView(view: privacyView, icon: "profile", text: "Personal details")
        setDetailView(view: faceIDView, icon: "profile", text: "Personal details")
        setDetailView(view: closeAccountView, icon: "profile", text: "Personal details")
        setDetailView(view: logoutView, icon: "profile", text: "Personal details")
        
    }
    
    private func setupUI() {
        profileImage.layer.masksToBounds = false
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.clipsToBounds = true
        profileImage.layer.borderWidth = 5
        profileImage.layer.borderColor = UIColor.white.cgColor
        
        nameLabel.text = "Mousa Amin Sharifi"
        subNameLabel.text = "iOS Developer"
    }
    
    private func setDetailView(view: UIView, icon: String, text: String) {
        let child = UIHostingController(rootView: IconTextHorizentalView(icon: icon, text: text))
        child.view.translatesAutoresizingMaskIntoConstraints = false
        child.view.frame = view.bounds
        view.addSubview(child.view)
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
    }
}
