//
//  HomeViewController.swift
//  My Bank
//
//  Created by Mousa on 03.06.21.
//

import UIKit
import SwiftUI
import FloatingPanel

class HomeViewController: UIViewController, FloatingPanelControllerDelegate {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var sendView: IconTextView!
    @IBOutlet weak var requestView: IconTextView!
    @IBOutlet weak var atmView: IconTextView!
    @IBOutlet weak var loanView: IconTextView!
    
    var fpc: FloatingPanelController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setFloatingTransactionView()
        
        setGroupedView(view: sendView, image: Assets.Images.send, title: "send")
        setGroupedView(view: requestView, image: Assets.Images.request, title: "request")
        setGroupedView(view: atmView, image: Assets.Images.atm, title: "atm")
        setGroupedView(view: loanView, image: Assets.Images.loan, title: "loan")
    }
    
    private func setFloatingTransactionView() {
        fpc = FloatingPanelController()
        
        // Assign self as the delegate of the controller.
        fpc.delegate = self // Optional
        
        // Set a content view controller.
        let contentVC = UIHostingController(rootView: TransactionView())
        fpc.set(contentViewController: contentVC)
        
        // Track a scroll view(or the siblings) in the content view controller.
        //                fpc.track(scrollView: contentVC.tableView)
        fpc.contentMode = .fitToBounds
        fpc.backdropView.backgroundColor = .black
        
        
        // Add and show the views managed by the `FloatingPanelController` object to self.view.
        fpc.addPanel(toParent: self)
    }
    
    private func setGroupedView(view: IconTextView, image: String, title: String) {
        view.titleLabel.text = title
        view.iconImage.image = UIImage(named: image)
    }
}
