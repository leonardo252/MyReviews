//
//  TextPlaceModal.swift
//  MyReviews
//
//  Created by Leonardo Gomes Fernandes on 18/08/20.
//  Copyright © 2020 Leonardo Gomes. All rights reserved.
//
//swiftlint:disable identifier_name

import Foundation

struct TextResults: Codable {
    let candidates: [TextCandidatePlace]
    let status: String
}

struct TextCandidatePlace: Codable {
    let formatted_address: String
    let name: String
    let geometry: Geometry
}

struct Geometry: Codable {
    let location: Location
}

struct Location: Codable {
    let lat: Double
    let lng: Double
}
