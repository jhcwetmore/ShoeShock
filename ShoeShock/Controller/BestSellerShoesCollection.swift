//
//  BestSellerShoesCollection.swift
//  ShoeShock
//
//  Created by Jonathan Wetmore on 4/24/20.
//  Copyright © 2020 Jonathan Wetmore. All rights reserved.
//

import UIKit

class BestSellerShoesCollection: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {
    private(set) public var products = [Product]()
    
    func initProducts(category: Category) {
        products = DataService.instance.getShoesBestSeller(forCategoryTitle: category.title)

    }
       
    //load the shoe array with products of type category.title
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BestSellerCell", for: indexPath) as? ProductCell {
            let item = products[indexPath.row]
            cell.updateCell(product: item)
            return cell
           }
        return ProductCell()
    }


    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
