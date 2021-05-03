//
//  FactCollectionViewCell.swift
//  Infobot
//
//  Created by Kevin Rheynaldi on 02/05/21.
//

import UIKit

class FactCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: FactCollectionViewCell.self)
    
    @IBOutlet weak var cardBgImageView: UIImageView!
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var cardTitleLbl: UILabel!
    @IBOutlet weak var cardDescriptionLbl: UILabel!
    
    func setup(_ card: FactModel) {
        cardBgImageView.image = #imageLiteral(resourceName: "bg-rectangle")
        cardImageView.image = card.image
        cardTitleLbl.text = card.title
        cardDescriptionLbl.text = card.description
    }
}
