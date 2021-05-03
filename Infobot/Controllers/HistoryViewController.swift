//
//  HistoryViewController.swift
//  Infobot
//
//  Created by Kevin Rheynaldi on 03/05/21.
//

import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    var histories: [HistoryModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        histories = [
            HistoryModel(year: "1900s", image: #imageLiteral(resourceName: "history1")),
            HistoryModel(year: "2000s", image: #imageLiteral(resourceName: "history1")),
            HistoryModel(year: "2100s", image: #imageLiteral(resourceName: "history1"))
        ]
        
    }

}

extension HistoryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return histories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HistoryCollectionViewCell.identifier, for: indexPath) as! HistoryCollectionViewCell
        
        cell.setup(histories[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
