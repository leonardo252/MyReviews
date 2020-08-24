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
    
    func setPlace(place: NewPlace) {
        locationImageView.image = place.image
        placeNameLabel.text = place.name
    }
}
