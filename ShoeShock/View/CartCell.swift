//
//  CartCell.swift
//  ShoeShock
//
//  Created by Jonathan Wetmore on 4/27/20.
//  Copyright © 2020 Jonathan Wetmore. All rights reserved.
//

import UIKit

class CartCell: UITableViewCell {
    var cartItem: CartItem?
    var delagate: CartVC?
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var itemQuantity: UILabel!
   
    
    func updateViews(item: CartItem) {
        self.cartItem = item
        itemImage.image = UIImage(named: item.item.image)
        itemTitle.text = item.item.model
        itemPrice.text = item.item.getProductCurrencyString()
        itemQuantity.text = "\(item.quantity)"
    }
    
    @IBAction func increaseQuantity(_ sender: UIButton) {
        if let cartItem = cartItem {
            cartItem.quantity += 1
            itemQuantity.text = "\(cartItem.quantity)"
            delagate?.updateTotalItems()
        }
    }
        
    @IBAction func decreaseQuantity(_ sender: UIButton) {
        if let cartItem = cartItem {
            cartItem.quantity -= 1
            itemQuantity.text = "\(cartItem.quantity)"
            if cartItem.quantity == 0 {
                DataService.instance.removeCartItem(theCartItem: cartItem.id)
                delagate?.tableView.reloadData()
            }
            delagate?.updateTotalItems()
        }
    }
        
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
