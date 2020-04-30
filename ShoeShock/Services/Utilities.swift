//
//  Utilities.swift
//  ShoeShock
//
//  Created by Jonathan Wetmore on 4/29/20.
//  Copyright © 2020 Jonathan Wetmore. All rights reserved.
//

import Foundation
class Utilities {
    static let instance = DataService()
    class func getCurrencyString(doubleValue: Double) -> String {
        var priceNumber: NSNumber = 0
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.current
        priceNumber = NSNumber(value: doubleValue)
        return currencyFormatter.string(from: priceNumber)!
    }
    
}
