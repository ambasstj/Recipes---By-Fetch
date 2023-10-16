//
//  desertAPI.swift
//  Recipes. Powered by Fetch
//
//  Created by Tevin Jones on 10/15/23.
//

import Foundation

struct dessertApiModel: Decodable{
   
    let meals: [meals]
    
}

struct meals: Decodable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}
