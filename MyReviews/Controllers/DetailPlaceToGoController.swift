//
//  DetailPlaceToGoController.swift
//  MyReviews
//
//  Created by Leonardo Gomes Fernandes on 23/08/20.
//  Copyright © 2020 Leonardo Gomes. All rights reserved.
//

import UIKit
import CoreData

class DetailPlaceToGoController: UIViewController {

    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var placeLocationLabel: UILabel!
    @IBOutlet weak var placeImageView: UIImageView!
    
    var container: NSPersistentContainer!
    var place: Place?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        placeNameLabel.text = place?.name
        placeLocationLabel.text = place?.address
        placeImageView.image = UIImage(named: "Place2")
        
    }
    
    @IBAction func deletePlace(_ sender: Any) {
        if let placeToDelete = place {
            container.viewContext.delete(placeToDelete)
            
            do {
                try self.container.viewContext.save()
            } catch {
                
            }
        }
        
        
    }
}
