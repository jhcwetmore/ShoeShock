//
//  Categories.swift
//  ShoeShock
//
//  Created by Jonathan Wetmore on 4/23/20.
//  Copyright © 2020 Jonathan Wetmore. All rights reserved.
//

import Foundation

struct Category: Comparable, Equatable {
    private(set) public var id: UUID
    private(set) public var title: String
    private(set) public var imageName: String
    
    init (title: String, imageName: String) {
        id = UUID()
        self.title = title
        self.imageName = imageName
    }
    
    static func < (lhs: Category, rhs: Category) -> Bool {
        return lhs.id == rhs.id
       }
       
}
