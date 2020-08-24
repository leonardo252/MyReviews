//
//  FindCell.swift
//  MyReviews
//
//  Created by Leonardo Gomes on 21/08/20.
//  Copyright © 2020 Leonardo Gomes. All rights reserved.
//

import UIKit

class FindCell: UITableViewCell {

    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var placeNameLabel: UILabel!
    
    func setPlace(place: NewPlace) {
        placeImageView.image = place.image
        placeNameLabel.text = place.name
    }
}
