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
    
    private var placeRepository = PlacesRepository()
    
    var place: Place?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        navigationController?.navigationBar.barStyle = .black
        placeNameLabel.text = place?.name
        placeLocationLabel.text = place?.address
        
    }
    
    @IBAction func addToGoButton(_ sender: Any) {
        print("added")
        
        guard let place = self.place else { return }
        
        
//        FileManager.default.printContent(from: NSHomeDirectory(), recursivelly: true)
        print("###################################################################################")
        placeRepository.createNewItem(newItem: place)
        
//        FileManager.default.printContent(from: NSHomeDirectory(), recursivelly: true)

         
    }
    
}
