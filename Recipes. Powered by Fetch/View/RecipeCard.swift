//
//  RecipeCard.swift
//  Recipes. Powered by Fetch
//
//  Created by Tevin Jones on 10/16/23.
//

import Foundation
import UIKit
import Kingfisher

class RecipeCard: UIViewController{
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var recipeCache: MealInfo?
    var name: String?
    var imageURL: URL?
    var instructions: String?
    var ingredients: String?
    var delegate: NetworkRequestsDelegate?
    var networkRequests: NetworkRequests?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkRequests = NetworkRequests()
        networkRequests?.delegate = self
        nameLabel.text = recipeCache?.strMeal
        imageView.kf.setImage(with: recipeCache?.strMealThumb)
    }
    
    func refreshUI() {
        print("refresh UI is being called")
        DispatchQueue.main.async {
            self.nameLabel.text = self.recipeCache?.strMeal
            self.imageView.kf.setImage(with: self.recipeCache?.strMealThumb)
        }
    }
}

extension RecipeCard: NetworkRequestsDelegate {
    
    func didFailWithError(error: Error) {
        
    }
    
    func didPopulateArray(desserts: [meals]) {
        
    }
    
    func didFetchIDinfo(recipes: [MealInfo]) {
        
    }
    
    
}
