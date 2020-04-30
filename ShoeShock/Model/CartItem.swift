//
//  CartItem.swift
//  ShoeShock
//
//  Created by Jonathan Wetmore on 4/27/20.
//  Copyright © 2020 Jonathan Wetmore. All rights reserved.
//

import Foundation

class CartItem {
    private(set) public var id:UUID
    private(set) public var item:Product
    public var quantity:Int

    init(item: Product, quantity:Int){
        id = UUID()
        self.item = item
        self.quantity = quantity
    }
}
