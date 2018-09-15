//
//  SpotsViewController.swift
//  FirstIosApp
//
//  Created by Weerawat Pleanchum on 4/8/2561 BE.
//  Copyright © 2561 Tom Weerawat. All rights reserved.
//

import UIKit
import MapKit
import Alamofire
class SpotsViewController: UITableViewController {
    enum Constants {
        static let baseURLPath = "https://nuuneoi.com/courses/500px/list"
        
    }
    var vacationSpots = [VacationSpot]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        vacationSpots = VacationSpot.loadAllVacationSpots()
        loadPhoto()
        
        
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vacationSpots.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VacationSpotCell", for: indexPath) as! VacationSpotCell
        let vacationSpot = vacationSpots[indexPath.row]
        cell.nameLabel.text = vacationSpot.name
        cell.locationNameLabel.text = vacationSpot.locationName
        cell.thumbnailImageView.image = UIImage(named: vacationSpot.thumbnailName)
        
        return cell
    }
    
    
    
    func loadPhoto() {
        
        Alamofire.request(Constants.baseURLPath).responseJSON{response in
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
            
        }
    }
}
