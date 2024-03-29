//
//  ToGoCell.swift
//  MyReviews
//
//  Created by Leonardo Gomes Fernandes on 19/08/20.
//  Copyright © 2020 Leonardo Gomes. All rights reserved.
//

import UIKit

class ToGoCell: UITableViewCell {

    @IBOutlet weak var locationImageView: UIImageView!
    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var placeLocationLabel: UILabel!
    
    func setPlace(place: Place) {
        locationImageView.image = UIImage(named: "Place1")
        placeNameLabel.text = place.name
        placeLocationLabel.text = place.address
    }
}
