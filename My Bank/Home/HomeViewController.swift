//
//  HomeViewController.swift
//  My Bank
//
//  Created by Mousa on 03.06.21.
//

import UIKit
import FloatingPanel

class HomeViewController: UIViewController, FloatingPanelControllerDelegate {

    var fpc: FloatingPanelController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fpc = FloatingPanelController()

                // Assign self as the delegate of the controller.
                fpc.delegate = self // Optional

                // Set a content view controller.
                let contentVC = WelcomeViewController()
                fpc.set(contentViewController: contentVC)

                // Track a scroll view(or the siblings) in the content view controller.
//                fpc.track(scrollView: contentVC.tableView)
//        fpc.contentMode = .fitToBounds
        fpc.backdropView.backgroundColor = .black


                // Add and show the views managed by the `FloatingPanelController` object to self.view.
                fpc.addPanel(toParent: self)
    }

}
