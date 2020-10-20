//
//  ReviewCell.swift
//  MyReviews
//
//  Created by Leonardo Gomes on 23/08/20.
//  Copyright © 2020 Leonardo Gomes. All rights reserved.
//

import UIKit

class ReviewCell: UITableViewCell {

    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var placeNameLabel: UILabel!
    
    func setPlace(place: Place) {
        placeImageView.image = UIImage(named: "Place1")
        placeNameLabel.text = place.name
    }
}
