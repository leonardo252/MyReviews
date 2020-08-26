//
//  PlaceRepository.swift
//  MyReviews
//
//  Created by Leonardo Gomes Fernandes on 24/08/20.
//  Copyright © 2020 Leonardo Gomes. All rights reserved.
//

import Foundation

class PlaceRepository: Repository {
    
    var plist: PlistManager<ThePlace>
    
    init(with plistName: String) {
        plist = PlistManager<ThePlace>(plistName: plistName)
    }
    
    func getAll() -> [ThePlace] {
        if let places = plist.readPlist() {
            return places
        }
        
        return [ThePlace]()
    }
    
    func get(objectID: String) -> ThePlace? {
        return nil
    }
    
    func add(object: ThePlace) {
        plist.addInPlist(object: object)
    }
    
    func update(object: ThePlace) {
        delete(object: object)
        add(object: object)
    }
    
    func delete(object: ThePlace) {
        if var plist = plist.readPlist() {
            plist = plist.filter { $0.placeID != object.placeID }
            self.plist.savePlist(object: plist)
        }
    }
    
    
}
