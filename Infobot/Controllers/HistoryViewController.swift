//
//  HistoryViewController.swift
//  Infobot
//
//  Created by Kevin Rheynaldi on 03/05/21.
//

import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    // Card transition manager
    let transitionManaager = CardTransitionManager()
    
    // Initialize array for HistoryModel
    var histories: [HistoryModel] = []
    
    var currentHistory = 0
    
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentHistory = indexPath.row
        performSegue(withIdentifier: "showDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            destination.image = histories[currentHistory].image
            destination.titleLbl = histories[currentHistory].year
        }
    }
}
