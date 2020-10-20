//
//  Place.swift
//  MyReviews
//
//  Created by Leonardo Gomes on 27/08/20.
//  Copyright © 2020 Leonardo Gomes. All rights reserved.
//

import Foundation

class Place: RepositoryItem {
    
    static let placeholder: (name: String, address: String) = (name: "Place Name",
    address: "Place Address")
    
    var idItem: String
    var name: String
    var address: String
    var review: String
    
    required init() {
        self.idItem = ""
        self.name = Self.placeholder.name
        self.address = Self.placeholder.address
        self.review = ""
    }
    
    
    
    
    
    
}
