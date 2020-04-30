//
//  DataService.swift
//  ShoeShock
//
//  Created by Jonathan Wetmore on 4/23/20.
//  Copyright © 2020 Jonathan Wetmore. All rights reserved.
//

import Foundation

class DataService {
    static let instance = DataService()
    private var cart: Cart = Cart()
    
    private let categories = [
        Category(title: "Running", imageName: "RunningCategory.png"),
        Category(title: "Golf", imageName: "GolfCategory.png"),
        Category(title: "Basketball", imageName: "BasketBallCategory.png"),
    ]
    
    private let shoesGolf:[Product] = [
        Product(brand: "FootJoy", model: "Tour X Boa", price: 229.99, image: "FJ_55406_01.png"),
        Product(brand: "FootJoy", model: "Tour X", price: 199.99, image: "FJ_55404_01.png"),
        Product(brand: "FootJoy", model: "Flex LE2", price: 129.99, image: "FJ_56118_01.png"),
        Product(brand: "FootJoy", model: "Superlites XP", price: 99.99, image: "FJ_56106_01.png")
    ]
    
    private let shoesGolfBestSeller:[Product] = [
         Product(brand: "FootJoy", model: "Tour X Boa", price: 229.99, image: "FJ_55406_01.png"),
         Product(brand: "FootJoy", model: "Tour X", price: 199.99, image: "FJ_55404_01.png"),
         Product(brand: "FootJoy", model: "Flex LE2", price: 129.99, image: "FJ_56118_01.png"),
         Product(brand: "FootJoy", model: "Superlites XP", price: 99.99, image: "FJ_56106_01.png")
     ]
    
    
    private let shoesRunning:[Product] = [
        Product(brand: "adidas", model: "Ultraboost DNA", price: 159.99, image: "adidas Ultraboost DNA.png"),
        Product(brand: "Under Armour", model: "Hovr Phantom SE", price: 140.00, image: "Under Armour Hovr Phantom SE.png"),
        Product(brand: "New Balance", model: "Fuelcell Echo", price: 100.00, image: "New Balance Fuelcell Echo.png"),
        Product(brand: "PUMA", model: "RS-X Cube", price: 99.99, image: "PUMA RS-X Cube.png")
    ]
   
    private let shoesBasketball:[Product] = [
        Product(brand: "Jordan", model: "Retro 4", price: 229.99, image: "Jordan Retor 4.png"),
        Product(brand: "Nike", model: "Zoom Freak 1", price: 109.99, image: "Nike Zoom Freak 1.png"),
        Product(brand: "Nike", model: "Lebron Soldier XIII SFG", price: 109.99, image: "Nike Lebron Soldier XIII SFG.png")]
    
    
  
    func getCategories() -> [Category]{
           return categories
           
    }
       
    func getShoes(forCategoryTitle title:String) -> [Product] {
        switch title {
            case "Running":
                return getShoesRunning()
            case "Golf":
                return getShoesGolf()
            case "Basketball":
                return getShoesBasketBall()
            default:
                return getShoesGolf()
        }
    }
    
    func getShoesBestSeller(forCategoryTitle title:String) -> [Product] {
           switch title {
               case "Running":
                   return getShoesRunningBestSeller()
               case "Golf":
                    return getShoesGolfBestSeller()
               case "Basketball":
                   return getShoesBasketBallBestSeller()
               default:
                   return getShoesGolfBestSeller()
           }
       }
       
    func getShoesGolf() -> [Product]{
           return shoesGolf
    }
    func getShoesRunning() -> [Product]{
        return shoesRunning
        
    }
    func getShoesBasketBall() -> [Product]{
        return shoesBasketball
    }
    
    func getShoesGolfBestSeller() -> [Product]{
        return shoesGolf
     }
     func getShoesRunningBestSeller() -> [Product]{
        return shoesRunning
         
     }
     func getShoesBasketBallBestSeller() -> [Product]{
        return shoesBasketball
            
     }
    
    func getCart() -> Cart {
        return cart
    }
    
    func addCartItem(product: Product, quantity: Int) {
        var itemFound: Bool = false
        if !cart.items.isEmpty {
            for item in cart.items {
                if item.item.upc == product.upc {
                    item.quantity += 1
                    itemFound = true
                }
            }
        }
        !itemFound ? cart.addItem(item: product, quantity: quantity) : ()
        cart.updateCartTotal()
    }
    
    func removeCartItem(theCartItem id: UUID){
        guard !cart.items.isEmpty else {return}
        var i = 0
        repeat {
            if cart.items[i].id == id {cart.items.remove(at: i)}
            i += 1
        } while i < cart.items.count
        cart.updateCartTotal()
    }
    
    
    func makePurchaseOrder() -> PurchaseOrder {
        let purchaseOrder = PurchaseOrder(itemsPurchased: self.cart.items)
        self.cart.items.removeAll()
        return purchaseOrder
    }
    
}
