//
//  HistoryCollectionViewCell.swift
//  Infobot
//
//  Created by Kevin Rheynaldi on 03/05/21.
//

import UIKit

class HistoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: HistoryCollectionViewCell.self)
    
    @IBOutlet weak var historyImageView: UIImageView!
    @IBOutlet weak var historyYearLbl: UILabel!
    
    func setup(_ history: HistoryModel) {
        historyImageView.image = history.image
        historyYearLbl.text = history.year
    }
}
