//
//  CategoryTableViewCell.swift
//  Infobot
//
//  Created by Kevin Rheynaldi on 03/05/21.
//

import UIKit

var currentTag = 0
var currentRow = 0

class CategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    weak var detailDelegate: DetailDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension CategoryTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories[collectionView.tag].images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CategoryCollectionViewCell
        
        cell.categoryImage.image = categories[collectionView.tag].images[indexPath.row]
        cell.categoryTitle.text = categories[collectionView.tag].titles[indexPath.row]
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("tag: \(collectionView.tag)")
//        print("index path: \(indexPath)")
        currentTag = collectionView.tag
        currentRow = indexPath.row
        detailDelegate?.navigateToDetail()
    }
    
}
