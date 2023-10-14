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
    }
    
    
    
    
}

extension RecipesTableView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.reusableCell, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row + 1)
    }
    
}
