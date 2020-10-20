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
    
    var places: [Place] = []
    
    var filteredTableData = [Place]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        places = populateArray()
        places = []
        tableView.reloadData()
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
//        resultSearchController.searchBar.searchTextField.backgroundColor = .black
        resultSearchController.searchBar.barStyle = .black
        resultSearchController.searchBar.barTintColor = .black
        resultSearchController.searchBar.backgroundColor = .black
        resultSearchController.searchBar.searchTextField.textColor = UIColor(named: "YellowDark")
//        resultSearchController.obscuresBackgroundDuringPresentation = false
        
        // Reload the table
        tableView.reloadData()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        places = []
    }
    
    func updateSearchResults(for searchController: UISearchController) {
//        filteredTableData.removeAll(keepingCapacity: false)
//
//        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
//        print(searchPredicate.predicateFormat)
//        places.forEach({ place in
//            if place.name == searchController.searchBar.text! {
//                print(place)
//                filteredTableData.append(place)
//            }
//        })
//        self.tableView.reloadData()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {        
        guard var textSearchBar = resultSearchController.searchBar.text else { return }
        textSearchBar = textSearchBar.replacingOccurrences(of: " ", with: "%20")
        Service.shared.findPlaceNearby(keyWord: textSearchBar, latitude: "-3.775836", longitude: "-38.573364") { (places) in
            places?.forEach({ nearbyPlace in
                let place = Place()
                place.idItem = nearbyPlace.place_id
                place.name = nearbyPlace.name
                place.address = nearbyPlace.vicinity
                self.filteredTableData.append(place)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            })
        }
    }
}

extension FindScreenController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredTableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let place = filteredTableData[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "findCell") as? FindCell else { return UITableViewCell() }
        cell.setPlace(place: place)
        cell.backgroundColor = .black
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailPlaceFindController {
            if let indexPath = tableView.indexPathForSelectedRow {
                destination.place = filteredTableData[indexPath.row]
                tableView.deselectRow(at: indexPath, animated: true)
            }
            
        }
    }
}
