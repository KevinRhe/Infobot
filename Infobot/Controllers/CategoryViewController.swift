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
            CategoryModel(category: "Power Source", images: [#imageLiteral(resourceName: "electric"), #imageLiteral(resourceName: "hydraulic-jack"), #imageLiteral(resourceName: "nuclear")], titles: ["Electric", "Hydraulic", "Nuclear"]),
            CategoryModel(category: "Application", images: [#imageLiteral(resourceName: "nuclear"), #imageLiteral(resourceName: "electric")], titles: ["Nuclear", "Electric"])
        ]
        
    }
    
}

extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
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
        
        cell.collectionView.tag = indexPath.section
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .white
    }
    
}
