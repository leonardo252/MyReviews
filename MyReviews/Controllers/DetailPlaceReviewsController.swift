//
//  DetailPlaceReviewsController.swift
//  MyReviews
//
//  Created by Leonardo Gomes Fernandes on 24/08/20.
//  Copyright © 2020 Leonardo Gomes. All rights reserved.
//

import UIKit

class DetailPlaceReviewsController: UIViewController {

    @IBOutlet weak var placeNameLabel: UILabel!
    
    var place: Place?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        navigationController?.navigationBar.barStyle = .black
        placeNameLabel.text = place?.name
    }
    


}
