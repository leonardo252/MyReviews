//
//  HTTP.swift
//  MyReviews
//
//  Created by Leonardo Gomes Fernandes on 17/08/20.
//  Copyright © 2020 Leonardo Gomes. All rights reserved.
//

import Foundation

enum HTTP {
    case get
    case post
    
    func request(url: URL?,
                 header: [String : String] = ["Content-Type":"application/json"],
                 body: [String : Any] = [:],
                 completion: @escaping (Data?, HTTPURLResponse?, String?) -> Void = { data, response, error in }) {
        
        guard let url = url else {
            completion(nil, nil, "Erro! URL Invalida")
            return
        }
        
        switch self {
        case .get:
            var urlRequest = URLRequest(url: url)
            urlRequest.allHTTPHeaderFields = header
            URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                completion(data, response as? HTTPURLResponse, error?.localizedDescription)
            }.resume()
            
        case .post:
            
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"
            urlRequest.allHTTPHeaderFields = header
            let data = try? JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
//            if let data = try? JSONSerialization.data(withJSONObject: body, options: .prettyPrinted){
//                urlRequest.httpBody = data
//            }
            
            URLSession.shared.uploadTask(with: urlRequest, from: data) { data, response, error in
                completion(data, response as? HTTPURLResponse, error?.localizedDescription)
            }.resume()
            
        }
    }
}
