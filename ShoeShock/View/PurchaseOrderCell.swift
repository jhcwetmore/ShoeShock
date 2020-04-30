//
//  PurchaseOrderCell.swift
//  ShoeShock
//
//  Created by Jonathan Wetmore on 4/29/20.
//  Copyright © 2020 Jonathan Wetmore. All rights reserved.
//

import UIKit

class PurchaseOrderCell: UITableViewCell {
    var purchaseOrderItem: CartItem!
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemBrand: UILabel!
    @IBOutlet weak var itemModel: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var itemQuantity: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   
    func updateViews(item: CartItem) {
        self.purchaseOrderItem = item
        itemImage.image = UIImage(named: item.item.image)
        itemBrand.text = item.item.brand
        itemModel.text = item.item.model
        itemPrice.text = item.item.getProductCurrencyString()
        itemQuantity.text = "\(item.quantity)"
        totalLabel.text = Utilities.getCurrencyString(doubleValue: item.item.price * Double(item.quantity))
        
    }
}
