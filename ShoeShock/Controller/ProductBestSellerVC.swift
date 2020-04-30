//
//  ShoeBestSellerVClViewController.swift
//  ShoeShock
//
//  Created by Jonathan Wetmore on 4/23/20.
//  Copyright © 2020 Jonathan Wetmore. All rights reserved.
//

import UIKit

class ProductBestSellerVC: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {
    private(set) public var products = [Product]()
    
    @IBOutlet weak var shoeCollection: UICollectionView!
    
    
    /*override func viewDidLoad() {
        super.viewDidLoad()
        
        //assign self as the UICollectionView delegate and datasource
        shoeCollection.dataSource = self
        shoeCollection.delegate = self
     
    }*/
    //load the products array with products of type category.title
    
    func initProducts(category: Category) {
           products = DataService.instance.getShoesBestSeller(forCategoryTitle: category.title)
           //navigationItem.title = category.title
           
    }
    
    //load the shoe array with products of type category.title
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BestSellerCell", for: indexPath) as? ProductCell {
            let product = products[indexPath.row]
            cell.updateCell(product: product)
            return cell
        }
        return ProductCell()
     }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
