//
//  DetailPlaceFindController.swift
//  MyReviews
//
//  Created by Leonardo Gomes Fernandes on 24/08/20.
//  Copyright © 2020 Leonardo Gomes. All rights reserved.
//
//swiftlint:disable force_cast

import UIKit
import CoreData

class DetailPlaceFindController: UIViewController {

    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var placeLocationLabel: UILabel!
    
    var container: NSPersistentContainer = (UIApplication.shared.delegate as! AppDelegate).persistentContainer
    
    
//    private var placeRepository = PlacesRepository()
    
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
        
        let toSavePlace = Place(context: container.viewContext)
        toSavePlace.name = self.place?.name
        toSavePlace.address = self.place?.address
        toSavePlace.idItem = self.place?.idItem
        
        do {
            let request = Place.fetchRequest() as NSFetchRequest<Place>
            
            let query = NSPredicate(format: "idItem == %@", argumentArray: [toSavePlace.idItem!])
            
            request.predicate = query
            
            let items = try container.viewContext.fetch(request)
            
            print(items)
            if items.count < 1 {
                print("Adding \(items.count)")
                try self.container.viewContext.save()
            } else {
                print("Já tem algo \(items.count)")
            }
            
        } catch {
            
        }
        
        
//        do {
//            try self.container.viewContext.save()
//        } catch {
//
//        }
//
        
//        FileManager.default.printContent(from: NSHomeDirectory(), recursivelly: true)
        print("###################################################################################")
//        placeRepository.createNewItem(newItem: place)
        
//        FileManager.default.printContent(from: NSHomeDirectory(), recursivelly: true)

         
    }
    
}
