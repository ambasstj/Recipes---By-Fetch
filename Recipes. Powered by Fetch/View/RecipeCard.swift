//
//  RecipeCard.swift
//  Recipes. Powered by Fetch
//
//  Created by Tevin Jones on 10/16/23.
//

import Foundation
import UIKit

class RecipeCard: UIViewController{
    @IBOutlet weak var nameLabel: UILabel!
    
    
    var name: String?
    var image: URL?
    var instructions: String?
    var ingredients: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = name
    }
    
    
}

