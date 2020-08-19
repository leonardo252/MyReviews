//
//  ServiceLayer.swift
//  MyReviews
//
//  Created by Leonardo Gomes Fernandes on 17/08/20.
//  Copyright © 2020 Leonardo Gomes. All rights reserved.
//

import Foundation


//struct ServiceLayer {
//
//    static func request(route: Router, completion: @escaping (Result<Data?,ErrorAPI>) -> Void) {
//
//        guard let request = route.urlRequest else {
//            completion(.failure(ErrorAPI.invalidURL))
//            return
//        }
//
//        let session = URLSession.shared
//
//        let dataTask = session.dataTask(with: request) { data, response, error in
//
//            if let _ = error {
//                completion(.failure(.faledRequest))
//                return
//            }
//
//            guard let response = response as? HTTPURLResponse else { return }
//
//            switch response.statusCode {
//            case 200:
//                completion(.success(data))
//            default:
//                completion(.failure(.unkownError(statusCode: 400)))
//            }
//        }
//
//        dataTask.resume()
//    }
//}

class Service {
    static let shared = Service()
    
    private init() {}
    
    func findPlaceNearby(keyWord: String, latitude: String, longitude: String, completion: @escaping ([NearbyPlace]?) -> Void) {
        
        let api = LocalAPI(route: .nearbySearch(keyWord: keyWord, latitude: latitude, longitude: longitude))
        
        guard let url = api.url else { return }
        HTTP.get.request(url: url) { (data, _, error) in
            guard let data = data else { return }
            
            do {
                let results =  try JSONDecoder().decode(NearbyResults.self, from: data)
                let places = results.results
                completion(places)
            } catch {
                print(error)
            }
        }
    }
    
    func findPlaceByText(keyWord: String, completion: @escaping ([TextCandidatePlace]?) -> Void) {
        
        let api = LocalAPI(route: .textSearch(keyWord: keyWord))
        
        guard let url = api.url else { return }
        HTTP.get.request(url: url) { (data, _, error) in
            guard let data = data else { return }

            do {
                let results =  try JSONDecoder().decode(TextResults.self, from: data)
                let candidates = results.candidates
                completion(candidates)
            } catch {
                print(error)
            }
        }
    }
    
    func detailPlace(placeID: String, completion: @escaping (DetailPlace?) -> Void) {
        
        let api = LocalAPI(route: .detailSearch(placeID: placeID))
        
        guard let url = api.url else { return }
        HTTP.get.request(url: url) { (data, _, error) in
            guard let data = data else { return }
            
            do {
                let details = try JSONDecoder().decode(DetailResult.self, from: data)
                let detail = details.result
                completion(detail)
            } catch {
                print(error)
            }
        }
        
    }
    
}
