//
//  NetworkRequest.swift
//  Recipes. Powered by Fetch
//
//  Created by Tevin Jones on 10/15/23.
//

import Foundation

protocol NetworkRequestsDelegate {
    
    func didFailWithError(error: Error)
    func didPopulateArray(desserts:[meals])
    func didFetchIDinfo(recipes: [MealInfo])
    func refreshUI()
}



struct NetworkRequests {
    
    let dessertsurl = "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert"
    let idurl = "https://www.themealdb.com/api/json/v1/1/lookup.php?i="
    var delegate: NetworkRequestsDelegate?
    var mealsPH: [meals]?
    var recipeInfo: [MealInfo]?
    
    func performRequest(with urlString: String) {
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                
                if error != nil {
                    print (error?.localizedDescription ?? "Something went wrong with your session task")
                    return
                }
                if let safeData = data {
                    
                    if urlString == dessertsurl{
                        let dessertArray = self.parseJSON(safeData)
                        self.delegate?.didPopulateArray(desserts: dessertArray)
                    }
                    if urlString.contains("lookup"){
                        print(urlString)
                        let infoArray = self.parseJSON2(safeData)
                        self.delegate?.didFetchIDinfo(recipes: infoArray)
                    }
                    }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ rawSafeData: Data) -> [meals] {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(dessertApiModel.self, from: rawSafeData)
            let mealsArray = decodedData.meals
            
            return mealsArray
        } catch {
            delegate?.didFailWithError(error: error)
            return []
        }
    }
    
    func parseJSON2(_ rawSafeData: Data) -> [MealInfo] {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(dishIDApiModel.self, from: rawSafeData)
            let infoArray = decodedData.meals
            
            return infoArray
        } catch {
            delegate?.didFailWithError(error: error)
            return []
        }
    }
}
