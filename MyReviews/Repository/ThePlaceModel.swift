//
//  ThePlaceModel.swift
//  MyReviews
//
//  Created by Leonardo Gomes Fernandes on 24/08/20.
//  Copyright © 2020 Leonardo Gomes. All rights reserved.
//

import Foundation

class ThePlaceModel {
    
    var places: [ThePlace]?
    
    var repository: Repository
    
    init(repository: Repository) {
        self.repository = repository
        places = self.repository.getAll()
    }
}
