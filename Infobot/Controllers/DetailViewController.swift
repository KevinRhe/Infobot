//
//  DetailViewController.swift
//  Infobot
//
//  Created by Kevin Rheynaldi on 04/05/21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailTitleLbl: UILabel!
    
    var image: UIImage?
    var titleLbl: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailImageView.image = image
        detailTitleLbl.text = titleLbl
        
    }
    
}
