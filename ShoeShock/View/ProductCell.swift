//
//  ShoeCollectionViewCell.swift
//  ShoeShock
//
//  Created by Jonathan Wetmore on 4/22/20.
//  Copyright © 2020 Jonathan Wetmore. All rights reserved.
//

import UIKit


class ProductCell: UICollectionViewCell {
    
  /*  @IBOutlet weak var brandText:UILabel!
    @IBOutlet weak var modelText:UILabel!
    @IBOutlet weak var priceText:UILabel!
    @IBOutlet weak var shoeImage:UIImageView!
*/
    
    @IBOutlet weak var productView: ProductView!
    @IBOutlet weak var selectProduct: UIButton!
    
   
    func updateCell(product:Product) {
       /* brandText.text = shoe.brand
        modelText.text = shoe.model
        priceText.text = "\(shoe.price)"
        shoeImage.image = UIImage(named: shoe.image)*/
        productView.updateView(product: product)

    }
    
    @IBAction func selectBtn(_ sender:Any?) {
        if let button:UIButton = sender as? UIButton {
            let image = UIImage(systemName: "heart.fill")
            button.setImage(image, for: .normal)
            button.tag = 1
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }



   
}
