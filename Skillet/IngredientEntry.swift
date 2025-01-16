//
//  File.swift
//  Skillet
//
//  Created by Kevin Nakadate on 1/16/25.
//

import Foundation
import SwiftData

@Model
class IngredientEntry: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case amount, unit, ingredientName
    }
    
    var id = UUID()
    var amount: Fraction
    var unit: String
    var ingredientName: String

    init(amount: Fraction, unit: String, ingredientName: String) {
        self.amount = amount
        self.unit = unit
        self.ingredientName = ingredientName
    }

    init() {
        self.amount = Fraction()
        self.unit = ""
        self.ingredientName = ""
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        amount = try container.decode(Fraction.self, forKey: .amount)
        unit = try container.decode(String.self, forKey: .unit)
        ingredientName = try container.decode(String.self, forKey: .ingredientName)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(amount, forKey: .amount)
        try container.encode(unit, forKey: .unit)
        try container.encode(ingredientName, forKey: .ingredientName)
    }
}
