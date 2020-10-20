//
//  MyReviewsController.swift
//  MyReviews
//
//  Created by Leonardo Gomes on 23/08/20.
//  Copyright © 2020 Leonardo Gomes. All rights reserved.
//

import UIKit

class MyReviewsController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var places: [Place] = []
    
    override func viewDidLoad() {
        
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .black
        tableView.backgroundColor = .black
        tableView.delegate = self
        tableView.dataSource = self
        
        print(places)
    }
    
}

extension MyReviewsController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let place = places[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "reviewCell") as? ReviewCell else { return UITableViewCell() }
        
        cell.setPlace(place: place)
        cell.backgroundColor = .black
        return cell        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailPlaceReviewsController {
            if let indexPath = tableView.indexPathForSelectedRow {
                destination.place = places[indexPath.row]
                tableView.deselectRow(at: indexPath, animated: true)
            }
            
        }
    }
}
