//
//  ShoeCellBestSellerCollectionViewCell.swift
//  ShoeShock
//
//  Created by Jonathan Wetmore on 4/23/20.
//  Copyright © 2020 Jonathan Wetmore. All rights reserved.
//

import UIKit

class ProductCellBestSeller: UICollectionViewCell {

     @IBOutlet weak var brandText:UILabel!
     @IBOutlet weak var modelText:UILabel!
     @IBOutlet weak var priceText:UILabel!
     @IBOutlet weak var shoeImage:UIImageView!
     
     func updateCell(shoe:Product) {
         brandText.text = shoe.brand
         modelText.text = shoe.model
         priceText.text = "\(shoe.price)"
         shoeImage.image = UIImage(named: shoe.image)
     }
     
     override func awakeFromNib() {
         super.awakeFromNib()
         // Initialization code
     }

    
}
