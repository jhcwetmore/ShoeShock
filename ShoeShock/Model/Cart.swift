//
//  Cart.swift
//  ShoeShock
//
//  Created by Jonathan Wetmore on 4/27/20.
//  Copyright © 2020 Jonathan Wetmore. All rights reserved.
//

import Foundation

class Cart {
   
    private(set) public var id:UUID
    public var items:[CartItem]=[]
    private(set) public var cartTotal: String
    
    func addItem(item: Product, quantity:Int){
        items.append(CartItem(item:item, quantity: quantity))
        updateCartTotal()
    }
    
    init(){
        id = UUID()
        cartTotal = "$0.00"
    }
    
    func updateCartTotal() {
        var total: Double = 0
        for cartItem in items {
            total +=  cartItem.item.price * Double(cartItem.quantity)
        }
        cartTotal = Utilities.getCurrencyString(doubleValue: total)
    }
}
