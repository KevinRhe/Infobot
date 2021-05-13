//
//  CategoryCollectionViewCell.swift
//  Infobot
//
//  Created by Kevin Rheynaldi on 13/05/21.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    static let identifier = "CategoryCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.cornerRadius = 5.0
        self.layer.shadowColor = #colorLiteral(red: 0.59130615, green: 0.5913938284, blue: 0.5912869573, alpha: 1)
        self.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.layer.shadowRadius = 1.0
        self.layer.shadowOpacity = 1
        self.layer.masksToBounds = false
    }
    
}
