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
}

struct NetworkRequests {
    
    let dessertsurl = "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert"
    var delegate: NetworkRequestsDelegate?
    var mealsPH: [meals]?
    
    func performRequest(with urlString: String) {
        
        if let url = URL(string: dessertsurl) {
            let session = URLSession(configuration: .default)
            print(session)
            let task = session.dataTask(with: url) { (data, response, error) in
                
                if error != nil {
                    print (error?.localizedDescription)
                    return
                }
                if let safeData = data {
                    let dessertArray = self.parseJSON(safeData)
                    self.delegate?.didPopulateArray(desserts: dessertArray)
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
}
