//
//  Ingredient.swift
//  Skillet
//
//  Created by Kevin Nakadate on 1/16/25.
//

import Foundation

class Ingredient: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case id, name, preferredBrand, notes
    }
    
    var id = UUID()
    var name: String
    var preferredBrand: String
    var notes: String

    init(name: String, preferredBrand: String, notes: String) {
        self.name = name
        self.preferredBrand = preferredBrand
        self.notes = notes
    }

    init() {
        self.name = ""
        self.preferredBrand = ""
        self.notes = ""
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        name = try container.decode(String.self, forKey: .notes)
        preferredBrand = try container.decode(String.self, forKey: .preferredBrand)
        notes = try container.decode(String.self, forKey: .notes)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(preferredBrand, forKey: .preferredBrand)
        try container.encode(notes, forKey: .notes)
    }
}
