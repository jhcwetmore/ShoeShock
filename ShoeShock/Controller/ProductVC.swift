//
//  ShowCollectionVC2.swift
//  productShock
//
//  Created by Jonathan Wetmore on 4/23/20.
//  Copyright © 2020 Jonathan Wetmore. All rights reserved.
//

import UIKit

class ProductVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    private(set) public var products = [Product]()
    private(set) public var category:Category!
    
    @IBOutlet weak var productCollection: UICollectionView!
    
                                 
    override func viewDidLoad() {
        super.viewDidLoad()
        //assign self as the UICollectionView delegate and datasource
        productCollection.dataSource = self
        productCollection.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.productCollection.reloadData()
    }
    
    
    //load the products array with products of type category.title
    func initProducts(category: Category) {
        self.category = category
        products = DataService.instance.getShoes(forCategoryTitle: category.title)
        navigationItem.title = category.title
    }
    
    //load the product array with products of type category.title
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCell {
            let product = products[indexPath.row]
            cell.updateCell(product: product)
            return cell
        }
        return ProductCell()
     }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = DataService.instance.getShoes(forCategoryTitle: category.title)[indexPath.row]
        performSegue(withIdentifier: "ProductDetailVC", sender: product)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let productDetailVC = segue.destination as? ProductDetailVC {
            let barBtn = UIBarButtonItem()
            barBtn.title = ""
            navigationItem.backBarButtonItem = barBtn
            
            assert(sender as? Product != nil)
            productDetailVC.product = sender as? Product
           // productDetailVC.updateView(product: sender as! Product)
        }
    }
}
