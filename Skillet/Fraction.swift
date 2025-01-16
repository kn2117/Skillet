//
//  Fraction.swift
//  Skillet
//
//  Created by Kevin Nakadate on 1/15/25.
//

import Foundation

class Fraction: Codable {
    var wholeNumber: Int
    var numerator: Int
    var denominator: Int {
        didSet {
            if (self.denominator == 0) {
                self.denominator = 1
            }
        }
    }
    
    func addFraction(addend: Fraction) -> Fraction {
        var sum = Fraction()
        sum.denominator = self.denominator * addend.denominator
        sum.numerator = self.numerator * addend.denominator + self.denominator * addend.numerator
        sum.wholeNumber = self.wholeNumber + addend.wholeNumber + sum.numerator / sum.denominator
        sum.numerator = sum.numerator & sum.denominator
        return sum
    }
    
    func multiplyFraction(multiplier: Int) -> Fraction {
        var product = Fraction()
        product.numerator = self.wholeNumber * self.denominator + self.numerator
        product.numerator *= multiplier
        product.wholeNumber = product.numerator / product.denominator
        product.numerator = product.numerator % product.denominator
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
