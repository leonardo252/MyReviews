//
//  FindScreenController.swift
//  MyReviews
//
//  Created by Leonardo Gomes on 20/08/20.
//  Copyright © 2020 Leonardo Gomes. All rights reserved.
//

import UIKit
import CoreLocation

class FindScreenController: UIViewController, UISearchResultsUpdating, UISearchBarDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    var resultSearchController = UISearchController()
    
    var places: [NewPlace] = []
    
    var filteredTableData = [NewPlace]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        places = populateArray()
        
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.barStyle = .black
        view.backgroundColor = .black
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.backgroundColor = .black
        tableView.dataSource = self
        tableView.delegate = self
        
        
        resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
//            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()

            tableView.tableHeaderView = controller.searchBar
            controller.searchBar.backgroundColor = .black
            return controller
        })()
        
        resultSearchController.searchBar.delegate = self
        resultSearchController.searchBar.searchTextField.backgroundColor = .black
        resultSearchController.searchBar.barTintColor = .black
        resultSearchController.searchBar.backgroundColor = .black
        resultSearchController.searchBar.searchTextField.textColor = UIColor(named: "YellowDark")
        
        // Reload the table
        tableView.reloadData()
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
    
    func updateSearchResults(for searchController: UISearchController) {
        filteredTableData.removeAll(keepingCapacity: false)

        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
        print(searchPredicate.predicateFormat)
        places.forEach({ place in
            if place.name == searchController.searchBar.text! {
                print(place)
                filteredTableData.append(place)
            }
        })
        
//        filteredTableData = array as! [String]

        self.tableView.reloadData()
    }
    
}

extension FindScreenController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if resultSearchController.isActive {
            return filteredTableData.count
        } else {
            return places.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var place: NewPlace
        if resultSearchController.isActive {
            place = filteredTableData[indexPath.row]
        } else {
            place = places[indexPath.row]
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "findCell") as? FindCell else { return UITableViewCell() }
        cell.setPlace(place: place)
        cell.backgroundColor = .black
        return cell
    }
}
