//
//  ViewController.swift
//  tabbar
//
//  Created by Riccardo Cipolleschi on 17/04/21.
//

import UIKit

open class TabBar: UIViewController {

  // MARK: Properties
  var rootView: TabBarView {
    return self.view as! TabBarView
  }

  open var viewControllers: [UIViewController] = [] {
    didSet {
      self.updateVM()
    }
  }

  open var selectedTab: Int? = nil {
    didSet {
      guard
        selectedTab != oldValue,
        let selectedTab = selectedTab
      else {
        return
      }

      // remove old
      if let oldValue = oldValue {
        self.remove(self.viewControllers[oldValue])
      }

      // add new
      self.add(viewControllers[selectedTab])
      self.updateVM()
    }
  }

  open var tabbarHeight: CGFloat = 50 {
    didSet {
      self.updateVM()
    }
  }

  open var tabbarVisible: Bool = true {
    didSet {
      self.updateVM()
    }
  }

  // MARK: Lifecycle

  deinit {
    self.removeObservers()
  }

  open override func loadView() {
    self.view = TabBarView()
    self.updateVM()
  }

  open override func viewDidLoad() {
    super.viewDidLoad()

    self.updateVM()
    self.setupInteractions()
    self.setupObservers()
  }
  
  // MARK: Behavior
  func setupInteractions() {
    self.rootView.userDidSelectTab = { [weak self] tab in
      self?.selectedTab = tab
    }
  }

  func updateVM() {
    self.rootView.viewModel = .init(
      tabs: self.viewControllers.compactMap(\.title),
      selectedTab: self.selectedTab ?? 0,
      orientation: UIDevice.current.orientation,
      tabbarHeight: self.tabbarHeight,
      isVisible: self.tabbarVisible
    )
  }

  func toggleTabbar() {
    self.tabbarVisible = !self.tabbarVisible
  }

  @objc func handleOrientationChange(_ notification: Notification) {
    self.updateVM()
  }

  // MARK: Observers
  func setupObservers() {
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(self.handleOrientationChange(_:)),
      name: UIDevice.orientationDidChangeNotification,
      object: nil
    )
  }

  func removeObservers() {
    NotificationCenter.default.removeObserver(self, name: UIDevice.orientationDidChangeNotification, object: nil)
  }
}

// MARK: - View Containment API
extension TabBar {

  func add(_ child: UIViewController, frame: CGRect? = nil) {
    addChild(child)

    if let frame = frame {
      child.view.frame = frame
    }

    view.addSubview(child.view)
    view.sendSubviewToBack(child.view)
    child.didMove(toParent: self)
  }

  /// Remove a vc previously added from the children
  func remove(_ child: UIViewController) {
    child.willMove(toParent: nil)
    child.view.removeFromSuperview()
    child.removeFromParent()
  }
}

