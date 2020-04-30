//
//  CartVC.swift
//  ShoeShock
//
//  Created by Jonathan Wetmore on 4/27/20.
//  Copyright © 2020 Jonathan Wetmore. All rights reserved.
//

import UIKit

class CartVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalItemsLabel: UILabel!
    @IBOutlet weak var cartTotalLabel: UILabel!
    @IBOutlet weak var purchaseBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        updateTotalItems()
        cartTotalLabel.text = DataService.instance.getCart().cartTotal
        updatePurchaseBtn()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.backBarButtonItem?.title = ""
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.getCart().items.count
    }
      
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell") as? CartCell {
            let cartItem = DataService.instance.getCart().items[indexPath.row]
            cell.updateViews(item: cartItem)
            cell.delagate = self
            return cell
        } else {
            return CartCell()
        }
    }
    
    func updateTotalItems() {
        let cart = DataService.instance.getCart()
        var totalItems: Int = 0
        for cartItem in cart.items {
            totalItems += cartItem.quantity
        }
        totalItemsLabel.text = "Total \(totalItems) Items"
        cart.updateCartTotal()
        cartTotalLabel.text = DataService.instance.getCart().cartTotal
        updatePurchaseBtn()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let purchaseOrderVC = segue.destination as? PurchaseOrderVC {
            let purchaseOrder = DataService.instance.makePurchaseOrder()
            purchaseOrderVC.updatePurchaseOrder(purchaseOrder: purchaseOrder)
            let btn = UIBarButtonItem()
            btn.title = ""
            
        }
    }
    
    func updatePurchaseBtn(){
        if DataService.instance.getCart().items.isEmpty {
            purchaseBtn.isEnabled = false
            purchaseBtn.setTitle("CART IS EMPTY", for: .disabled)
        } else {
            purchaseBtn.isEnabled = true
            purchaseBtn.setTitle("PURCHASE", for: .normal)
        }
               
    }
   
}
