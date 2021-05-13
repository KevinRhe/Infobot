//
//  HistoryCell.swift
//  Infobot
//
//  Created by Kevin Rheynaldi on 05/05/21.
//

import UIKit

class HistoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var historyImage: UIImageView!
    @IBOutlet weak var historyYear: UILabel!
    
    static let identifier = "HistoryCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(_ history: HistoryModel) {
        historyImage.image = history.image
        historyYear.text = history.year
    }

}
