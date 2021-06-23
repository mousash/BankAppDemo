//
//  CustomButton.swift
//  My Bank
//
//  Created by Mousa on 01.06.21.
//

import UIKit

@IBDesignable
final class AccentButton: UIButton {

    @IBInspectable var titleText: String? {
        didSet {
            self.setTitle(titleText, for: .normal)
            self.setTitleColor(UIColor.black,for: .normal)
        }
    }

    override init(frame: CGRect){
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }

    func setup() {
        self.clipsToBounds = true
        self.layer.cornerRadius = 15
        self.layer.backgroundColor = UIColor(named: Assets.Colors.accent)?.cgColor
    }
}
