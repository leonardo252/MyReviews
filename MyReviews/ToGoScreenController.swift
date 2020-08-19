//
//  ToGoScreenController.swift
//  MyReviews
//
//  Created by Leonardo Gomes Fernandes on 19/08/20.
//  Copyright © 2020 Leonardo Gomes. All rights reserved.
//

import UIKit

class ToGoScreenController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var places: [NewPlace] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        places = populateArray()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barStyle = .black
        view.backgroundColor = .black
        
    }
    
    func populateArray() -> [NewPlace] {
        
        var tempPlaces: [NewPlace] = []
        let place1 = NewPlace(idPlace: "place1", image: UIImage(imageLiteralResourceName: "Place1"), name: "Local 1")
        let place2 = NewPlace(idPlace: "place2", image: UIImage(imageLiteralResourceName: "Place2"), name: "Local 2")
        let place3 = NewPlace(idPlace: "place3", image: UIImage(imageLiteralResourceName: "Place3"), name: "Local 3")
        let place4 = NewPlace(idPlace: "place4", image: UIImage(imageLiteralResourceName: "Place4"), name: "Local 4")
        let place5 = NewPlace(idPlace: "place5", image: UIImage(imageLiteralResourceName: "Place5"), name: "Local 5")
        let place6 = NewPlace(idPlace: "place6", image: UIImage(imageLiteralResourceName: "Place6"), name: "Local 6")
        let place7 = NewPlace(idPlace: "place7", image: UIImage(imageLiteralResourceName: "Place7"), name: "Local 7")
        
        tempPlaces.append(place1)
        tempPlaces.append(place2)
        tempPlaces.append(place3)
        tempPlaces.append(place4)
        tempPlaces.append(place5)
        tempPlaces.append(place6)
        tempPlaces.append(place7)
        
        return tempPlaces
    }

}

extension ToGoScreenController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let place = places[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "toGoCell") as? ToGoCell else { return UITableViewCell() }
        cell.setPlace(place: place)
        cell.backgroundColor = .black
        return cell
    }
    
    
}
