//
//  CategoryViewController.swift
//  Infobot
//
//  Created by Kevin Rheynaldi on 03/05/21.
//

import UIKit

var categories: [CategoryModel] = []

class CategoryViewController: UIViewController {
    
    @IBOutlet weak var categoryTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categories = [
            CategoryModel(category: "Based on The Power Source", images: [#imageLiteral(resourceName: "electric"), #imageLiteral(resourceName: "hydraulic-jack"), #imageLiteral(resourceName: "nuclear"), #imageLiteral(resourceName: "green")], titles: ["Electrical", "Hydraulic", "Nuclear", "Green Energy"]),
            CategoryModel(category: "Based on Their Application", images: [#imageLiteral(resourceName: "industrial-robot"), #imageLiteral(resourceName: "exploration-robot"), #imageLiteral(resourceName: "hydraulic-jack"), #imageLiteral(resourceName: "electric"), #imageLiteral(resourceName: "hydraulic-jack"), #imageLiteral(resourceName: "electric")], titles: ["Industrial", "Exploration", "Consumer", "Medical", "Aerospace", "Aquatic"]),
            CategoryModel(category: "Based on Movement", images: [#imageLiteral(resourceName: "wheeled-robot"), #imageLiteral(resourceName: "legged-robot"), #imageLiteral(resourceName: "electric"), #imageLiteral(resourceName: "hydraulic-jack")], titles: ["Wheeled", "Legged", "Swimming", "Flying"])
        ]
        
    }
    
}

extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categories[section].category
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = categoryTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CategoryTableViewCell
        
//        cell.detailDelegate = self
        cell.collectionView.tag = indexPath.section
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .white
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            destination.image = categories[currentTag].images[currentRow]
            destination.titleLbl = categories[currentTag].titles[currentRow]
        }
    }
    
}

extension CategoryViewController: DetailDelegate {
    
    func navigateToDetail() {
        performSegue(withIdentifier: "showDetail", sender: self)
    }
    
}
