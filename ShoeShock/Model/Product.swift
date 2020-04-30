//
//  Shoe.swift
//  ShoeShock
//
//  Created by Jonathan Wetmore on 4/22/20.
//  Copyright © 2020 Jonathan Wetmore. All rights reserved.
//

import Foundation

struct Product: Equatable, Comparable {
    
    private(set) public var upc: UUID
    private(set) public var brand: String
    private(set) public var model: String
    private(set) public var price: Double
    private(set) public var image: String


    init(brand: String, model: String, price: Double, image: String){
        self.upc = UUID()
        self.brand = brand
        self.model = model
        self.price = price
        self.image = image
    }
    
    static func < (lhs: Product, rhs: Product) -> Bool {
           return lhs.upc == rhs.upc
    }
    
    func getProductCurrencyString() -> String {
        return Utilities.getCurrencyString(doubleValue: self.price)
        /*var priceNumber: NSNumber = 0
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.current
        priceNumber = NSNumber(value: self.price)
        return currencyFormatter.string(from: priceNumber)!*/
    }
    
}
