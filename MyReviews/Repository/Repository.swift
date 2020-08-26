//
//  Repository.swift
//  MyReviews
//
//  Created by Leonardo Gomes Fernandes on 24/08/20.
//  Copyright © 2020 Leonardo Gomes. All rights reserved.
//

import Foundation


protocol Repository {
    
    func getAll() -> [ThePlace]
    func get(objectID: String) -> ThePlace?
    func add(object: ThePlace)
    func update(object: ThePlace)
    func delete(object: ThePlace)
    
}
