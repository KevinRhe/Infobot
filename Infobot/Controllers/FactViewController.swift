//
//  FactViewController.swift
//  Infobot
//
//  Created by Kevin Rheynaldi on 02/05/21.
//

import UIKit

class FactViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var facts: [FactModel] = []
    
    var currentFact = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Fact card data
        facts = [
            FactModel(title: "Definition", description: "Robot is a machine that can perform a complicated series of tasks by itself", image: #imageLiteral(resourceName: "definition")),
            FactModel(title: "Origin of The Term ‘Robot’", description: "The word ‘robot’ derives from the Czech word “robota,” or forced labor, as done by serfs.", image: #imageLiteral(resourceName: "origin"))
        ]
        
        // Set page control dots count
        pageControl.numberOfPages = facts.count
        
        // Page control click event
        pageControl.addTarget(self, action: #selector(pageControlSelectionAction(sender:)), for: UIControl.Event.valueChanged)
        
    }
    
    @objc func pageControlSelectionAction(sender: Any) {
        let xVal = CGFloat(pageControl.currentPage) * collectionView.frame.size.width
        collectionView.setContentOffset(CGPoint(x: xVal, y: 0), animated: true)
    }

}

extension FactViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return facts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FactCollectionViewCell.identifier, for: indexPath) as! FactCollectionViewCell
        
        cell.setup(facts[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentFact = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentFact
    }
    
}
