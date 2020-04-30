//
//  PurchaseOrder.swift
//  ShoeShock
//
//  Created by Jonathan Wetmore on 4/29/20.
//  Copyright © 2020 Jonathan Wetmore. All rights reserved.
//

import Foundation

struct PurchaseOrder {
    private(set) public var id: UUID
    var items: [CartItem] = []
    
    init() {
        id = UUID()
    }
    
    init(itemsPurchased products: [CartItem]) {
        self.init()
        items = products
    }
    
    func getPO_TotalCurrencyString() -> String {
        var total: Double = 0
        var price: NSNumber = 0
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.current
        for orderItem in items {
            //let stringPrice = orderItem.item.price.dropFirst()
            price = NSNumber(value: orderItem.item.price)
            total +=  price.doubleValue * Double(orderItem.quantity)
         }
        return currencyFormatter.string(from:NSNumber(value: total))!
    }
    
    func totalItems() -> Int {
        var totalItems: Int = 0
        for item in items {
            totalItems += item.quantity
        }
        return totalItems
    }
}
