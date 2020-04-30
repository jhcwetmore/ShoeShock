//
//  PurchaseOrderVC.swift
//  ShoeShock
//
//  Created by Jonathan Wetmore on 4/29/20.
//  Copyright © 2020 Jonathan Wetmore. All rights reserved.
//

import UIKit

class PurchaseOrderVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private(set) var purchaseOrder: PurchaseOrder = PurchaseOrder()
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var totalPurchaseLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        totalPurchaseLabel.text = "Total Purchase: \(purchaseOrder.getPO_TotalCurrencyString())"
         //navigationItem.title = "\(purchaseOrder.items.count) Items Purchased"
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesBackButton = true
        navigationItem.title = "\(purchaseOrder.totalItems()) Items Purchased"
    }
    
    func updatePurchaseOrder(purchaseOrder: PurchaseOrder){
        self.purchaseOrder = purchaseOrder
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        purchaseOrder.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PurchaseOrderItemCell") as? PurchaseOrderCell {
            cell.updateViews(item: purchaseOrder.items[indexPath.row])
            return cell
        } else {
            return PurchaseOrderCell()
        }
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
