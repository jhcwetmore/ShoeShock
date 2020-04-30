//
//  ProductDetailVC.swift
//  ShoeShock
//
//  Created by Jonathan Wetmore on 4/28/20.
//  Copyright © 2020 Jonathan Wetmore. All rights reserved.
//

import UIKit

class ProductDetailVC: UIViewController {
    var product: Product?
    
    @IBOutlet weak var brandText:UILabel!
    @IBOutlet weak var modelText:UILabel!
    @IBOutlet weak var priceText:UILabel!
    @IBOutlet weak var shoeImage:UIImageView!
    @IBOutlet weak var selectBtn:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brandText.text = self.product!.brand
        modelText.text = self.product!.model
        priceText.text = "\(self.product!.getProductCurrencyString())"
        shoeImage.image = UIImage(named: self.product!.image)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.backBarButtonItem?.title = ""
        navigationItem.title = product?.model
    }
    
    func updateView(product: Product) {
        self.product = product
        brandText.text = self.product!.brand
        modelText.text = self.product!.model
        priceText.text = "\(self.product!.price)"
        shoeImage.image = UIImage(named: self.product!.image)

    }
    
    @IBAction func addToCart(_ sender:Any?){
        guard product != nil else {return}
        DataService.instance.addCartItem(product: product!, quantity: 1)
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
