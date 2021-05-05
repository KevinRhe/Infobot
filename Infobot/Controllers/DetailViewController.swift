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
    @IBOutlet weak var detailContentLbl: UILabel!
    
    var image: UIImage?
    var titleLbl: String?
    var contentLbl: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailImageView.image = image
        detailTitleLbl.text = titleLbl
        detailContentLbl.text = contentLbl
        
    }
    
}
