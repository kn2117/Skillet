//
//  Fraction.swift
//  Skillet
//
//  Created by Kevin Nakadate on 1/15/25.
//

import Foundation
import SwiftData

@Model
class Fraction: Codable {
    enum CodingKeys: CodingKey {
        case wholeNumber, numerator, denominator
    }
    
    var wholeNumber: Int
    var numerator: Int
    var denominator: Int {
        didSet {
            if (self.denominator == 0) {
                self.denominator = 1
            }
        }
    }
    
    func gcd(a: Int, b: Int) -> Int {
        let larger = max(a, b)
        let smaller = min(a, b)
        
        if (larger == smaller) {
            return smaller
        }
        return gcd(a: larger - smaller, b: smaller)
    }
    
    func addFraction(addend: Fraction) -> Fraction {
        let sum = Fraction()
        var greatestCommonDivisor: Int
        sum.denominator = self.denominator * addend.denominator
        sum.numerator = self.numerator * addend.denominator + self.denominator * addend.numerator
        sum.wholeNumber = self.wholeNumber + addend.wholeNumber + sum.numerator / sum.denominator
        sum.numerator = sum.numerator % sum.denominator
        greatestCommonDivisor = gcd(a: sum.numerator, b: sum.denominator)
        sum.numerator /= greatestCommonDivisor
        sum.denominator /= greatestCommonDivisor
        return sum
    }
    
    func multiplyFraction(multiplier: Int) -> Fraction {
        let product = Fraction()
        var greatestCommonDivisor: Int
        product.numerator = self.wholeNumber * self.denominator + self.numerator
        product.numerator *= multiplier
        product.wholeNumber = product.numerator / product.denominator
        product.numerator = product.numerator % product.denominator
        greatestCommonDivisor = gcd(a: product.numerator, b: product.denominator)
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
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        wholeNumber = try container.decode(Int.self, forKey: .wholeNumber)
        numerator = try container.decode(Int.self, forKey: .numerator)
        denominator = try container.decode(Int.self, forKey: .denominator)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(wholeNumber, forKey: .wholeNumber)
        try container.encode(numerator, forKey: .numerator)
        try container.encode(denominator, forKey: .denominator)
    }
}
