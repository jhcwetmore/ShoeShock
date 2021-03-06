//
//  BorderShadowButton.swift
//  CoolCars
//
//  Created by Jonathan Wetmore on 3/19/20.
//  Copyright © 2020 Jonathan Wetmore. All rights reserved.
//

import UIKit

class BorderShadowButton: BorderButton {
    override func awakeFromNib() {
           super.awakeFromNib()
           layer.cornerRadius = 5
           layer.shadowColor = UIColor.lightGray.cgColor
           layer.shadowRadius = 5
           layer.shadowOffset = CGSize(width: 0, height:3.0)
           layer.shadowOpacity = 1.0
           layer.shadowRadius = 10.0
       }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
