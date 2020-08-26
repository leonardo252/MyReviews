//
//  DetailPlaceToGoController.swift
//  MyReviews
//
//  Created by Leonardo Gomes Fernandes on 23/08/20.
//  Copyright © 2020 Leonardo Gomes. All rights reserved.
//

import UIKit

class DetailPlaceToGoController: UIViewController {

    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var placeLocationLabel: UILabel!
    @IBOutlet weak var placeImageView: UIImageView!
    
    var place: NewPlace?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        placeNameLabel.text = place?.name
        placeLocationLabel.text = place?.location
        placeImageView.image = place?.image
        
    }
    
    @objc func addTapped() {
        print("Buton Tapped")
    }
}
