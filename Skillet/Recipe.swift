//
//  Recipe.swift
//  Skillet
//
//  Created by Kevin Nakadate on 1/13/25.
//

import Foundation

struct Recipe {
    var name: String
    var ingredients: ingredient
    var directions: String
    
    struct ingredient {
        var amount: Double
        var unit: String
        var ingredientName: String
    }
}
