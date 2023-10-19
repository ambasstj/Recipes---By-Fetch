//
//  DishCell.swift
//  Recipes. Powered by Fetch
//
//  Created by Tevin Jones on 10/14/23.
//

import UIKit
import AVFoundation
import Kingfisher

class DishCell: UITableViewCell {
    
    @IBOutlet weak var desertImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        desertImage.layer.cornerRadius = 20
    }
}
