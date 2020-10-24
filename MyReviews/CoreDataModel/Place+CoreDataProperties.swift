//
//  Place+CoreDataProperties.swift
//  MyReviews
//
//  Created by Leonardo Gomes on 20/10/20.
//  Copyright © 2020 Leonardo Gomes. All rights reserved.
//
//

import Foundation
import CoreData


extension Place {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Place> {
        return NSFetchRequest<Place>(entityName: "Place")
    }

    @NSManaged public var address: String?
    @NSManaged public var idItem: String?
    @NSManaged public var name: String?
    @NSManaged public var review: String?

}

extension Place : Identifiable {

}
