//
//  RecipesTableView.swift
//  Recipes. Powered by Fetch
//
//  Created by Tevin Jones on 10/14/23.
//

import Foundation
import UIKit
import Kingfisher

class RecipesTableView: UIViewController {
    
    @IBOutlet weak var navBarOutlet: UINavigationBar!
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    @IBOutlet weak var button: UIButton!
    
    
    var networkRequests: NetworkRequests?
    var recipeCardVC: RecipeCard?
    var mealPH = [meals]()
    var recipesPH: MealInfo?
    var indexPH = Int()
    
    override func viewDidLoad() {
        navigationItem.title = "(っ˘ڡ˘ς)"
        tableViewOutlet.dataSource = self
        tableViewOutlet.delegate = self
        tableViewOutlet.register(UINib(nibName: "DishCell", bundle: nil), forCellReuseIdentifier: K.reusableCell)
        networkRequests = NetworkRequests()
        networkRequests?.delegate = self
        
        
        networkRequests?.performRequest(with: networkRequests?.dessertsurl ?? "")
    }
    
    override func viewDidAppear(_ animated: Bool) {
       
        networkRequests?.performRequest(with: networkRequests?.dessertsurl ?? "")
    }
}

extension RecipesTableView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealPH.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.reusableCell, for: indexPath)
        as! DishCell
        
        cell.nameLabel.text = mealPH[indexPath.row].strMeal
        cell.desertImage.kf.setImage(with: mealPH[indexPath.row].strMealThumb)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        indexPH = indexPath.row
        let mealID = mealPH[indexPath.row].idMeal
        networkRequests?.performRequest(with: (networkRequests?.idurl ?? "") + mealID)
        performSegue(withIdentifier: K.Segues.loadedCard, sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        
        if segue.identifier == K.Segues.loadedCard {
            let destinationVC = segue.destination as! RecipeCard
            recipeCardVC = destinationVC
            destinationVC.delegate = recipeCardVC
          
        }
        
    }
}

extension RecipesTableView: NetworkRequestsDelegate {
    
    func refreshUI() {
        
    }
    
   
    
    func didFetchIDinfo(recipes: [MealInfo]) {
        recipesPH = recipes[0]
        //Commenting here so i remember later to use a cache inside a destination view controller when sending over values. This solved an issue I was having where the RecipeCard VC simply would not load the values in time. and I'd have to click back and forth just to get the previous value to load. Tried what felt like a million different approaches. This one works and makes sense to me.
        recipeCardVC?.recipeCache = recipesPH
        recipeCardVC?.refreshUI()
    }
    
    
    func didFailWithError(error: Error) {
        print("this is where the error is \(error.localizedDescription)")
    }
    
    func didPopulateArray(desserts: [meals]) {
        mealPH = desserts
        
        DispatchQueue.main.async {
            self.tableViewOutlet.reloadData()
            self.tableViewOutlet.addSubview(self.button)
        }
    }
}
