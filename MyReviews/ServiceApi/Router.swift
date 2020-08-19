//
//  Router.swift
//  MyReviews
//
//  Created by Leonardo Gomes Fernandes on 17/08/20.
//  Copyright © 2020 Leonardo Gomes. All rights reserved.
//

import Foundation
import UIKit

//enum Router {
//
//    case nearbySearch(keyword: String, latitude: String, longitude: String)
//    case textSearch(keyword: String)
//    case detailSearch(placeID: String)
//
//    var scheme: String {
//        return "https"
//    }
//
//    var host: String {
//        return "maps.googleapis.com/maps/api/place"
//    }
//
//    var path: String {
//        switch self {
//        case .nearbySearch(let keyword, let latitude, let longitude):
//            return "/nearbysearch/json?location=\(latitude),\(longitude)&radius=50000&keyword=\(keyword)&key=AIzaSyCZqunBn-ekSsjrTtnw3H0wxMW9lQS63ro"
//
//        case .textSearch(let keyword):
//            return "/findplacefromtext/json?input=\(keyword)&inputtype=textquery&fields=business_status,photos,formatted_address,name,rating,opening_hours,geometry,icon,place_id&key=AIzaSyCZqunBn-ekSsjrTtnw3H0wxMW9lQS63ro"
//        case .detailSearch(let placeID):
//            return "/details/json?place_id=\(placeID)&fields=name,rating,formatted_phone_number&key=AIzaSyCZqunBn-ekSsjrTtnw3H0wxMW9lQS63ro"
//
//        }
//    }
//
//    var params: [URLQueryItem] {
//        let apiKey = "AIzaSyCZqunBn-ekSsjrTtnw3H0wxMW9lQS63ro"
//        ver queryItem = [URLQueryItem(name: "key", value: apiKey)]
//
//        queryItem.joined(separetaot: "+")
//        return []
//    }
//
//    var header: [String: String] {
//        switch self {
//        default:
//            return ["": "]
//        }
//    }
//
//    var body: Data? {
//        switch self {
//        default:
//            return nil
//        }
//    }
//
//    var method: String {
//        switch self {
//        case .nearbySearch:
//            return "GET"
//        case .textSearch:
//            return "GET"
//        case .detailSearch:
//            return "GET"
//        }
//    }
//
//    var url: URL? {
//        var components = URLComponents()
//        components.scheme = self.scheme
//        components.host = self.host
//        components.path = self.path
//        if !self.params.isEmpty {
//            components.queryItems = self.params
//        }
//
//        return components.url
//    }
//
//    var urlRequest: URLRequest? {
//        guard let url = self.url else { return nil }
//
//        print(url.absoluteString)
//        var request = URLRequest(url: url)
//        request.httpMethod = self.method
//        request.allHTTPHeaderFields = self.header
//
//        return request
//    }
//}


enum Router {
    case nearbySearch(keyWord: String, latitude: String, longitude: String)
    case textSearch(keyWord: String)
    case detailSearch(placeID: String)
}


struct LocalAPI {
    
    let host: String = "https://maps.googleapis.com/maps/api/place"
    let key: String = "AIzaSyCZqunBn-ekSsjrTtnw3H0wxMW9lQS63ro"
    
    var route: Router
    
    var url: URL? {
        switch route {
        case .nearbySearch(let keyWord, let latitude, let longitude):
            return URL(string: "\(host)/nearbysearch/json?location=\(latitude),\(longitude)&radius=50000&keyword=\(keyWord)&key=\(key)")
        case .detailSearch(let placeID):
            return URL(string: "\(host)/details/json?place_id=\(placeID)&key=\(key)")
        case .textSearch(let keyWord):
            return URL(string: "\(host)/findplacefromtext/json?input=\(keyWord)&inputtype=textquery&fields=business_status,photos,formatted_address,name,rating,opening_hours,geometry,icon,place_id&key=\(key)")
        }
    }
}
