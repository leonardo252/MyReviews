//
//  DetailPlaceModal.swift
//  MyReviews
//
//  Created by Leonardo Gomes Fernandes on 18/08/20.
//  Copyright © 2020 Leonardo Gomes. All rights reserved.
//
//swiftlint:disable identifier_name

import Foundation
import UIKit

struct DetailResult: Codable {
    let html_attributions: [String]
    let result: DetailPlace
    let status:  String
}

struct DetailPlace: Codable {
    let place_id: String
    let formatted_address: String
    let formatted_phone_number: String
    let rating: Float
    let url: String
    let opening_hours: OpenHours
}

struct OpenHours: Codable {
    let open_now: Bool
    let weekday_text: [String]
}






struct NewPlace {
    let idPlace: String
    let image: UIImage
    let name: String
    
}
