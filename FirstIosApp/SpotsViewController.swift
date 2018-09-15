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
import AlamofireImage
class SpotsViewController: UITableViewController {
    enum Constants {
        static let baseURLPath = "https://nuuneoi.com/courses/500px/list"
        
    }
    @IBOutlet var tableViewLoad: UITableView!
    var vacationSpots = [VacationSpot]()
    var heroes = [Hero]()
    let URL_GET_DATA = "https://simplifiedcoding.net/demos/marvel/"
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        vacationSpots = VacationSpot.loadAllVacationSpots()
         loadHero()
      
        
        
    }
    override func viewDidLoad() {
         super.viewDidLoad()
       
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VacationSpotCell", for: indexPath) as! VacationSpotCell
//        let vacationSpot = vacationSpots[indexPath.row]
//        cell.nameLabel.text = vacationSpot.name
//        cell.locationNameLabel.text = vacationSpot.locationName
//        cell.thumbnailImageView.image = UIImage(named: vacationSpot.thumbnailName)
        let hero: Hero
        hero = heroes[indexPath.row]
        
        cell.nameLabel.text = hero.name
        cell.locationNameLabel.text = hero.team
      
        Alamofire.request(hero.imageUrl!).responseImage { response in
            debugPrint(response)
            
            if let image = response.result.value {
                cell.thumbnailImageView.image = image
                
            }
        }
        
        
        
        return cell
    }

    func loadHero(){
        //fetching data from web api
        Alamofire.request(URL_GET_DATA).responseJSON { response in
            
            //getting json
            if let json = response.result.value {
                
                //converting json to NSArray
                let heroesArray : NSArray  = json as! NSArray
                
                //traversing through all elements of the array
                for i in 0..<heroesArray.count{
                    
                    //adding hero values to the hero list
                    self.heroes.append(Hero(
                        name: (heroesArray[i] as AnyObject).value(forKey: "name") as? String,
                        team: (heroesArray[i] as AnyObject).value(forKey: "team") as? String,
                        imageUrl: (heroesArray[i] as AnyObject).value(forKey: "imageurl") as? String
                    ))
                    
                }
                self.tableViewLoad.reloadData()
            }
            
        }
        
    }
    func loadPhoto(){
        Alamofire.request(Constants.baseURLPath).responseJSON{response in
            //            print(response)
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
            
            
        }
        
    }
   
}
