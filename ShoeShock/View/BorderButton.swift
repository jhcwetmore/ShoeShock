//
//  BorderButton.swift
//  app-swoosh
//
//  Created by Jonathan Wetmore on 3/10/20.
//  Copyright © 2020 Jonathan Wetmore. All rights reserved.
//

import UIKit

class BorderButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 1.0
        layer.borderColor =
            UIColor.gray.cgColor
 
    }

}
