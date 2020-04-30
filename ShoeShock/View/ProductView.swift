//
//  ProductView.swift
//  ShoeShock
//
//  Created by Jonathan Wetmore on 4/27/20.
//  Copyright © 2020 Jonathan Wetmore. All rights reserved.
//

import UIKit

class ProductView: BorderShadowView {

    private var product: Product?
    private var inCart: Bool = false
    
    @IBOutlet weak var brandText:UILabel!
    @IBOutlet weak var modelText:UILabel!
    @IBOutlet weak var priceText:UILabel!
    @IBOutlet weak var shoeImage:UIImageView!
    @IBOutlet weak var selectBtn:UIButton!
    
    func updateView(product:Product) {
        self.product = product
        brandText.text = product.brand
        modelText.text = product.model
        priceText.text = "\(product.getProductCurrencyString())"
        shoeImage.image = UIImage(named: product.image)
        let cartItems = DataService.instance.getCart().items
        inCart = false
        for cartItem in cartItems  {
            if cartItem.item.upc == product.upc{
                inCart = true
                break
            }
        }
        
        inCart ? setInCartHeartBtnOn(button: selectBtn) : setInCartHeartBtnOff(button: selectBtn)
    }
    
    @IBAction func productSelected(_ sender:Any){
        
        if let button:UIButton = sender as? UIButton {
            if let product = self.product {
                let image = UIImage(systemName: "heart.fill")
                button.setImage(image, for: .normal)
                button.tag = 1
                DataService.instance.addCartItem(product: product, quantity: 1)
                print ("\(DataService.instance.getCart().items)")
            }
        }
    }
    
    func setInCartHeartBtnOn(button: UIButton){
        let image = UIImage(systemName: "heart.fill")
        button.setImage(image, for: .normal)
        button.tag = 1
    }
    
    func setInCartHeartBtnOff(button: UIButton){
        let image = UIImage(systemName: "heart")
        button.setImage(image, for: .normal)
        button.tag = 0
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
