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
    

    @IBOutlet weak var instructionsLabel: UILabel!
    
    @IBOutlet weak var mLabel1: UILabel!
    
    @IBOutlet weak var iLabel1: UILabel!
    
    @IBOutlet weak var mLabel2: UILabel!
    
    @IBOutlet weak var iLabel2: UILabel!
    
    @IBOutlet weak var mlabel3: UILabel!
    
    @IBOutlet weak var ilabel3: UILabel!
    
    @IBOutlet weak var mlabel4: UILabel!
    
    @IBOutlet weak var ilabel4: UILabel!
    
    @IBOutlet weak var mlabel5: UILabel!
    
    @IBOutlet weak var iLabel5: UILabel!
    
    @IBOutlet weak var mLabel6: UILabel!
    
    @IBOutlet weak var iLabel6: UILabel!
    
    @IBOutlet weak var mLabel7: UILabel!
    
    @IBOutlet weak var iLabel7: UILabel!
    
    @IBOutlet weak var mLabel8: UILabel!
    
    @IBOutlet weak var iLabel8: UILabel!
    
    @IBOutlet weak var mLabel9: UILabel!
    
    @IBOutlet weak var iLabel9: UILabel!
    
    @IBOutlet weak var mLabel10: UILabel!
    
    @IBOutlet weak var iLabel10: UILabel!
    
    @IBOutlet weak var mLabel11: UILabel!
    
    @IBOutlet weak var iLabel11: UILabel!
    
    
    @IBOutlet weak var mLabel12: UILabel!
    
    @IBOutlet weak var iLabel12: UILabel!
    
    
    
    var recipeCache: MealInfo?
    var instructions: String?
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
            
            self.instructionsLabel.text = self.recipeCache?.strInstructions
            
            self.mLabel1.text = self.recipeCache?.strMeasure1
            self.iLabel1.text = self.recipeCache?.strIngredient1
            
            self.mLabel2.text = self.recipeCache?.strMeasure2
            self.iLabel2.text = self.recipeCache?.strIngredient2
            
            self.mlabel3.text = self.recipeCache?.strMeasure3
            self.ilabel3.text = self.recipeCache?.strIngredient3
            
            self.mlabel4.text = self.recipeCache?.strMeasure4
            self.ilabel4.text = self.recipeCache?.strIngredient4
            
            self.mlabel5.text = self.recipeCache?.strMeasure5
            self.iLabel5.text = self.recipeCache?.strIngredient5
            
            self.mLabel6.text = self.recipeCache?.strMeasure6
            self.iLabel6.text = self.recipeCache?.strIngredient6
            
            self.iLabel7.text = self.recipeCache?.strIngredient7
            self.mLabel7.text = self.recipeCache?.strMeasure7
            
            self.mLabel8.text = self.recipeCache?.strMeasure8
            self.iLabel8.text = self.recipeCache?.strIngredient8
            
            self.mLabel9.text = self.recipeCache?.strMeasure9
            self.iLabel9.text = self.recipeCache?.strIngredient9
            
            self.mLabel10.text = self.recipeCache?.strMeasure10
            self.iLabel10.text = self.recipeCache?.strIngredient10
            
            self.mLabel11.text = self.recipeCache?.strMeasure11
            self.iLabel11.text = self.recipeCache?.strIngredient11
            
            self.mLabel12.text = self.recipeCache?.strMeasure12
            self.iLabel12.text = self.recipeCache?.strIngredient12
           
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
