//
//  CategoryViewController.swift
//  Infobot
//
//  Created by Kevin Rheynaldi on 03/05/21.
//

import UIKit

class CategoryViewController: UIViewController {
    
    @IBOutlet weak var categoryTable: UITableView!

    var categories: [CategoryModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categories = [
            CategoryModel(category: "Based on The Power Source", images: [#imageLiteral(resourceName: "electric"), #imageLiteral(resourceName: "hydraulic-jack"), #imageLiteral(resourceName: "nuclear"), #imageLiteral(resourceName: "green")], titles: ["Electrical", "Hydraulic", "Nuclear", "Green Energy"]),
            CategoryModel(category: "Based on Their Application", images: [#imageLiteral(resourceName: "industrial-robot"), #imageLiteral(resourceName: "exploration-robot"), #imageLiteral(resourceName: "hydraulic-jack"), #imageLiteral(resourceName: "electric"), #imageLiteral(resourceName: "hydraulic-jack"), #imageLiteral(resourceName: "electric")], titles: ["Industrial", "Exploration", "Consumer", "Medical", "Aerospace", "Aquatic"]),
            CategoryModel(category: "Based on Movement", images: [#imageLiteral(resourceName: "wheeled-robot"), #imageLiteral(resourceName: "legged-robot"), #imageLiteral(resourceName: "electric"), #imageLiteral(resourceName: "hydraulic-jack")], titles: ["Wheeled", "Legged", "Swimming", "Flying"])
        ]
        
        categoryTable.register(CategoryTableViewCell.nib(), forCellReuseIdentifier: CategoryTableViewCell.identifier)
        categoryTable.delegate = self
        categoryTable.dataSource = self
        
    }
    
}

extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 50))
        headerView.backgroundColor = nil
        
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 5, width: headerView.frame.width-40, height: headerView.frame.height-10)
        label.text = categories[section].category
//        label.font =
//        label.textColor =
        
        headerView.addSubview(label)
        
        return headerView
        
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 100
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = categoryTable.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath) as! CategoryTableViewCell
        
        cell.configure(with: categories[indexPath.row])
        
        return cell
        
    }

    // Perform segue
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destination = segue.destination as? DetailViewController {
//            destination.image = categories[currentTag].images[currentRow]
//            destination.titleLbl = categories[currentTag].titles[currentRow]
//        }
//    }
    
}

//extension CategoryViewController: DetailDelegate {
//
//    func navigateToDetail() {
//        performSegue(withIdentifier: "showDetail", sender: self)
//    }
//
//}
