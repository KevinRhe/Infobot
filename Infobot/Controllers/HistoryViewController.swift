//
//  HistoryViewController.swift
//  Infobot
//
//  Created by Kevin Rheynaldi on 03/05/21.
//

import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    // Initialize array for HistoryModel
    var histories: [HistoryModel] = []
    
    var currentHistory = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        histories = [
            HistoryModel(year: "1495", image: #imageLiteral(resourceName: "history-1495-2"), title: "Leonardo's Robot",detail: "The design notes for the robot appear in sketchbooks that were rediscovered in the 1950s."),
            HistoryModel(year: "1937", image: #imageLiteral(resourceName: "history-1937"), title: "Elektro", detail: "Elektro is the nickname of a robot built by the Westinghouse Electric Corporation in its Mansfield, Ohio facility between 1937 and 1938."),
            HistoryModel(year: "1961", image: #imageLiteral(resourceName: "history-1961-2"), title: "Unimate", detail: "Unimate was the first industrial robot, which worked on a General Motors assembly line at the Inland Fisher Guide Plant in Ewing Township, New Jersey, in 1961."),
            HistoryModel(year: "1991", image: #imageLiteral(resourceName: "history-1991-2"), title: "Honda P Series", detail: "The P series is a chronological progression of prototype humanoid robots as developed by Honda.")
        ]
        
        collectionView.register(UINib(nibName: "HistoryCell", bundle: nil), forCellWithReuseIdentifier: "historyIdentifier")
        
    }

}

extension HistoryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return histories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "historyIdentifier", for: indexPath) as! HistoryCell
        
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
            destination.titleLbl = histories[currentHistory].title
            destination.contentLbl = histories[currentHistory].detail
        }
    }
}
