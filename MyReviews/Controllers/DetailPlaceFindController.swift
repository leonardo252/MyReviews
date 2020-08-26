//
//  DetailPlaceFindController.swift
//  MyReviews
//
//  Created by Leonardo Gomes Fernandes on 24/08/20.
//  Copyright © 2020 Leonardo Gomes. All rights reserved.
//

import UIKit

class DetailPlaceFindController: UIViewController {

    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var placeLocationLabel: UILabel!
    
    var place: NewPlace?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(addTapped))
        placeNameLabel.text = place?.name
        placeLocationLabel.text = place?.location
        
    }
    
    @objc func addTapped() {
        print("Added")
    }
}
