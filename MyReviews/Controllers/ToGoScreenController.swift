//
//  ToGoScreenController.swift
//  MyReviews
//
//  Created by Leonardo Gomes Fernandes on 19/08/20.
//  Copyright © 2020 Leonardo Gomes. All rights reserved.
//
//swiftlint:disable force_cast
import UIKit
import CoreData

class ToGoScreenController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
//    private var placeRepository = PlacesRepository()
    var container: NSPersistentContainer = (UIApplication.shared.delegate as! AppDelegate).persistentContainer
    
//    var container: NSPersistentContainer!
    
    var places: [Place] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.barStyle = .black
        view.backgroundColor = .black
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.backgroundColor = .black
        tableView.delegate = self
        tableView.dataSource = self

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        do {
            let request = Place.fetchRequest() as NSFetchRequest<Place>
            
            places = try container.viewContext.fetch(request)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch {
            
        }
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailPlaceToGoController {
            destination.container = self.container
            if let indexPath = tableView.indexPathForSelectedRow {
                destination.place = places[indexPath.row]
                tableView.deselectRow(at: indexPath, animated: true)
            }
            
        }
    }
    
    
}
