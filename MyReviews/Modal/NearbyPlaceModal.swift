//
//  NearbyPlaceModal.swift
//  MyReviews
//
//  Created by Leonardo Gomes on 17/08/20.
//  Copyright © 2020 Leonardo Gomes. All rights reserved.
//
//swiftlint:disable identifier_name

import Foundation

struct NearbyResults: Codable {
    let html_attributions: [String]
    let results: [NearbyPlace]
    let status:  String
}

struct NearbyPlace: Codable {
    let place_id: String
    let name: String
}
