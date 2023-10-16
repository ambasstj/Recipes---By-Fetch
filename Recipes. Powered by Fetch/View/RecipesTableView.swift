//
//  RecipesTableView.swift
//  Recipes. Powered by Fetch
//
//  Created by Tevin Jones on 10/14/23.
//

import Foundation
import UIKit

class RecipesTableView: UIViewController {
    
    @IBOutlet weak var navBarOutlet: UINavigationBar!
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    var networkRequests: NetworkRequests?
    var mealPH = [meals]()
    
    override func viewDidLoad() {
        tableViewOutlet.dataSource = self
        tableViewOutlet.delegate = self
        tableViewOutlet.register(UINib(nibName: "DishCell", bundle: nil), forCellReuseIdentifier: K.reusableCell)
        networkRequests = NetworkRequests()
        networkRequests?.delegate = self
        
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
        
        cell.desertImage.isHidden = false
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
    
}

extension RecipesTableView: NetworkRequestsDelegate {
    
    func didFailWithError(error: Error) {
        print(error.localizedDescription)
    }
    
    func didPopulateArray(desserts: [meals]) {
        mealPH = desserts
        print(desserts[0].strMeal)
        print(mealPH[0].idMeal)
        
        DispatchQueue.main.async {
            self.tableViewOutlet.reloadData()
        }
        
    }
    
    
}
