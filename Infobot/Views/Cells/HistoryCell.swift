//
//  HistoryCell.swift
//  Infobot
//
//  Created by Kevin Rheynaldi on 05/05/21.
//

import UIKit

class HistoryCell: UICollectionViewCell {

    @IBOutlet weak var historyImage: UIImageView!
    @IBOutlet weak var historyYear: UILabel!
    @IBOutlet weak var historyMainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        historyMainView.layer.cornerRadius = 20.0
    }
    
    func setup(_ history: HistoryModel) {
        historyImage.image = history.image
        historyYear.text = history.year
    }

}
