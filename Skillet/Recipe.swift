//
//  Recipe.swift
//  Skillet
//
//  Created by Kevin Nakadate on 1/13/25.
//

import Foundation
import SwiftData

@Model
class Recipe: Identifiable {
    var id = UUID()
    var name: String
    var ingredients: [ingredient]
    var directions: String

    struct ingredient: Codable {
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
    }

    struct Fraction: Codable {
        var wholeNumber: Int
        var numerator: Int
        var denominator: Int {
            didSet {
                if self.denominator == 0 {
                    self.denominator = 1
                }
            }
        }

        func gcd(a: Int, b: Int) -> Int {
            let larger = max(a, b)
            let smaller = min(a, b)

            if larger == smaller {
                return smaller
            }
            return gcd(a: larger - smaller, b: smaller)
        }

        func addFraction(addend: Fraction) -> Fraction {
            var sum = Fraction()
            var greatestCommonDivisor: Int
            sum.denominator = self.denominator * addend.denominator
            sum.numerator =
                self.numerator * addend.denominator + self.denominator
                * addend.numerator
            sum.wholeNumber =
                self.wholeNumber + addend.wholeNumber + sum.numerator
                / sum.denominator
            sum.numerator = sum.numerator % sum.denominator
            greatestCommonDivisor = gcd(a: sum.numerator, b: sum.denominator)
            sum.numerator /= greatestCommonDivisor
            sum.denominator /= greatestCommonDivisor
            return sum
        }

        func multiplyFraction(multiplier: Int) -> Fraction {
            var product = Fraction()
            var greatestCommonDivisor: Int
            product.numerator =
                self.wholeNumber * self.denominator + self.numerator
            product.numerator *= multiplier
            product.wholeNumber = product.numerator / product.denominator
            product.numerator = product.numerator % product.denominator
            greatestCommonDivisor = gcd(
                a: product.numerator, b: product.denominator)
            product.numerator /= greatestCommonDivisor
            product.denominator /= greatestCommonDivisor
            return product
        }

        init(wholeNumber: Int, numerator: Int, denominator: Int) {
            self.wholeNumber = wholeNumber
            self.numerator = numerator
            self.denominator = denominator
        }

        init() {
            self.wholeNumber = 0
            self.numerator = 0
            self.denominator = 1
        }
    }

    init(name: String, ingredients: [ingredient], directions: String) {
        self.name = name
        self.ingredients = ingredients
        self.directions = directions
    }

    init(name: String) {
        self.name = name
        self.ingredients = [
            ingredient()
        ]
        self.directions = ""
    }
}
