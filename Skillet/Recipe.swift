//
//  Recipe.swift
//  Skillet
//
//  Created by Kevin Nakadate on 1/13/25.
//

import Foundation
import SwiftData

@Model
class Recipe {
    var name: String
    var ingredients: [ingredient]
    var directions: String
    
    struct ingredient: Codable {
        var amount: Double
        var unit: String
        var ingredientName: String
    }
    
    init(name: String, ingredients: [ingredient], directions: String) {
        self.name = name
        self.ingredients = ingredients
        self.directions = directions
    }
    
    init() {
        self.name = ""
        self.ingredients = [ingredient(amount: 0.0, unit: "", ingredientName: "")]
        self.directions = ""
    }
}
