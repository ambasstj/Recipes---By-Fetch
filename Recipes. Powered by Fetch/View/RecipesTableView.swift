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
    
    override func viewDidLoad() {
        tableViewOutlet.dataSource = self
        tableViewOutlet.delegate = self
        tableViewOutlet.register(UINib(nibName: "DishCell", bundle: nil), forCellReuseIdentifier: K.reusableCell)
    }
    
    
    
    
}

extension RecipesTableView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.reusableCell, for: indexPath)
        as! DishCell
        
        cell.textLabel?.text = "\(indexPath.row)"
        cell.desertImage.isHidden = false
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: K.Segues.recipeCard, sender: self)
        
    }
    
}
