//
//  TabBarView.swift
//  tabbar
//
//  Created by Riccardo Cipolleschi on 17/04/21.
//

import UIKit

struct TabBarVM: Equatable {
  let tabs: [String]
  let selectedTab: Int
  let orientation: UIDeviceOrientation
  let tabbarHeight: CGFloat
  let isVisible: Bool

  func shouldReload(from oldModel: Self?) -> Bool {
    return self.tabs != oldModel?.tabs ||
      self.selectedTab != oldModel?.selectedTab ||
      self.orientation != oldModel?.orientation
  }

  func shouldAnimate(from oldModel: Self?) -> Bool {
    return self.isVisible != oldModel?.isVisible
  }
}

class TabBarView: UIView {

  var viewModel: TabBarVM? {
    didSet {
      self.update(old: oldValue)
    }
  }

  lazy var collection: UICollectionView = {
    let collectionLayout = UICollectionViewFlowLayout()

    collectionLayout.scrollDirection = .horizontal
    collectionLayout.minimumInteritemSpacing = 0
    collectionLayout.minimumLineSpacing = 1

    let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)

    collection.dataSource = self
    collection.delegate = self

    collection.register(TabBarCell.self, forCellWithReuseIdentifier: TabBarCell.reuseIdentifier)

    return collection
  }()

  var userDidSelectTab: ((Int) -> Void)?

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.setup()
    self.style()
  }


  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setup() {
    self.addSubview(self.collection)
  }

  func style() {
    self.backgroundColor = .clear

    self.collection.layer.borderWidth = 1
    self.collection.layer.borderColor = UIColor.systemGray.cgColor
    self.collection.backgroundColor = UIColor.clear
  }

  func update(old: TabBarVM?) {

    if self.viewModel?.shouldReload(from: old) ?? false {
      self.collection.reloadData()
    }

    self.setNeedsLayout()

    if self.viewModel?.shouldAnimate(from: old) ?? false {
      UIView.animate(
        withDuration: 0.3,
        delay: 0,
        options: [.curveEaseInOut],
        animations: { [unowned self] in
          self.layoutIfNeeded()
      })
    }


  }

  override func layoutSubviews() {
    super.layoutSubviews()

    let height = (self.viewModel?.tabbarHeight ?? 50)
    let isVisible = self.viewModel?.isVisible ?? true

    let tabbarHeight = self.safeAreaInsets.bottom + height
    self.collection.frame = .init(
      x: 0,
      y: self.bounds.height - (isVisible ? tabbarHeight : 0),
      width: self.bounds.width,
      height: tabbarHeight
    )
  }
}

// MARK: - Extension
extension TabBarView: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(
      width: collectionView.bounds.width / CGFloat(self.viewModel?.tabs.count ?? 1),
      height: collectionView.bounds.height
    )
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    self.userDidSelectTab?(indexPath.row)
  }
}

extension TabBarView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.viewModel?.tabs.count ?? 0
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView
      .dequeueReusableCell(withReuseIdentifier: TabBarCell.reuseIdentifier, for: indexPath) as! TabBarCell

    guard let model = self.viewModel else {
      return cell
    }

    cell.viewModel = .init(
      title: model.tabs[indexPath.row],
      isSelected: indexPath.row == model.selectedTab
    )

    return cell
  }
}

