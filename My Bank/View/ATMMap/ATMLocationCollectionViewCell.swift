//
//  ATMLocationCollectionViewCell.swift
//  My Bank
//
//  Created by Mousa on 23.06.21.
//

import UIKit

class ATMLocationCollectionViewCell: UICollectionViewCell {

    static let identifier = "\(ATMLocationCollectionViewCell.self)"
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var awayLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bgView.layer.cornerRadius = 15
    }

    func configure(data: Location) {
        titleLabel.text = data.title
    }
    
}
