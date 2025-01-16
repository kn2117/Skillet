//
//  Recipe.swift
//  Skillet
//
//  Created by Kevin Nakadate on 1/13/25.
//

import Foundation
import SwiftData

@Model
class Recipe: Fraction, Identifiable {
    var id = UUID()
    var name: String
    var ingredients: [ingredient]
    var directions: String
    
    struct ingredient: Codable {
        var amount: Fraction
        var unit: String
        var ingredientName: String
    }
    
    init(name: String, ingredients: [ingredient], directions: String) {
        self.name = name
        self.ingredients = ingredients
        self.directions = directions
    }
    
    init(name: String) {
        self.name = name
        self.ingredients = [ingredient(amount: Fraction(), unit: "", ingredientName: "")]
        self.directions = ""
    }
}
