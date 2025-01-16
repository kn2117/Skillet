//
//  Recipe.swift
//  Skillet
//
//  Created by Kevin Nakadate on 1/13/25.
//

import Foundation
import SwiftData

@Model
class Recipe: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case id, name, ingredients, directions, notes
    }

    var id = UUID()
    var name: String
    var ingredients: [IngredientEntry]
    var directions: String
    var notes: String

    init(name: String, ingredients: [IngredientEntry], directions: String, notes: String) {
        self.name = name
        self.ingredients = ingredients
        self.directions = directions
        self.notes = notes
    }

    init(name: String) {
        self.name = name
        self.ingredients = [
            IngredientEntry()
        ]
        self.directions = ""
        self.notes = ""
    }

    init() {
        self.name = ""
        self.ingredients = [
            IngredientEntry()
        ]
        self.directions = ""
        self.notes = ""
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        ingredients = try container.decode(
            [IngredientEntry].self, forKey: .ingredients)
        directions = try container.decode(String.self, forKey: .directions)
        notes = try container.decode(String.self, forKey: .notes)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(ingredients, forKey: .ingredients)
        try container.encode(directions, forKey: .directions)
        try container.encode(notes, forKey: .notes)
    }
}
