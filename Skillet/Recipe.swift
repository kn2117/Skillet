//
//  Recipe.swift
//  Skillet
//
//  Created by Kevin Nakadate on 1/13/25.
//

import Foundation

class Recipe {
    var name: String
    var ingredients: [ingredient]
    var directions: String
    
    struct ingredient {
        var amount: Double
        var unit: String
        var ingredientName: String
    }
    
    init(name: String, ingredients: [ingredient], directions: String) {
        self.name = name
        self.ingredients = ingredients
        self.directions = directions
    }
}
