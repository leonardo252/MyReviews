//
//  ViewController.swift
//  MyReviews
//
//  Created by Leonardo Gomes on 13/08/20.
//  Copyright © 2020 Leonardo Gomes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Service.shared.findPlaceNearby(keyWord: "IFCE", latitude: "-3.775836", longitude: "-38.573364") { (places) in
            places?.forEach({ nearbyPlace in
                //                print(nearbyPlace)
            })
        }
        
        Service.shared.findPlaceByText(keyWord: "IFCE") { (candidates) in
            candidates?.forEach({ textCandidatePlace in
                //                print(textCandidatePlace)
            })
            
        }
        
        //        ChIJ5VD8XBpJxwcRhLpZ69j6tzU ID ifce
        Service.shared.detailPlace(placeID: "ChIJ5VD8XBpJxwcRhLpZ69j6tzU") { (detail) in
            print(detail!.opening_hours)
        }
    }
    
}
