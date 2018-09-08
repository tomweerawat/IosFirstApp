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
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        vacationSpots = VacationSpot.loadAllVacationSpots()
//        print(vacationSpots)
        Alamofire.request(Constants.baseURLPath).responseJSON{response in
            //            print(response)
           
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
            
            
        }
        
        
        
    }
    
   
}
