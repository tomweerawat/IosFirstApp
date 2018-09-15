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
import SVProgressHUD

class SpotsViewController: UITableViewController {
 
    @IBOutlet var tableViewHeroes: UITableView!
    var vacationSpots = [VacationSpot]()
    let URL_GET_DATA = "https://simplifiedcoding.net/demos/marvel/"
     var heroes = [Hero]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        loadHero()
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
         vacationSpots = VacationSpot.loadAllVacationSpots()
//        loadImage()
    }
  
   
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vacationSpots.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SpotCell", for: indexPath) as! SpotCell

        let vacationSpot = vacationSpots[indexPath.row]

        cell.nameLabel.text = vacationSpot.name

        cell.ThumbImage.image = UIImage(named: vacationSpot.thumbnailName)
        return cell
       
//        let cell = tableView.dequeueReusableCell(withIdentifier: "SpotCell", for: indexPath) as! SpotCell
//
//        //getting the hero for the specified position
//        let hero: Hero
//        hero = heroes[indexPath.row]
//
//        //displaying values
//        cell.nameLabel.text = hero.name
//        cell.locationName.text = hero.team
//
//
//        //displaying image
//        Alamofire.request(hero.imageUrl!).responseImage { response in
//            debugPrint(response)
//
//            if let image = response.result.value {
//                cell.ThumbImage.image = image
//            }
//        }
//
//        return cell
    }
    
    func loadImage() {
                vacationSpots = VacationSpot.loadAllVacationSpots()
                Alamofire.request(Constants.Constant.baseURLPath).responseJSON{response in
                    if let json = response.result.value {
                        print("TJSON: \(json)") // serialized json response
                    }
        
                }
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    private func loadHero(){
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
                print(self.tableViewHeroes.reloadData())
                //displaying data in tableview
                DispatchQueue.main.async {
                     self.tableViewHeroes.reloadData()
                }
               
            }
            
        }
        
        
        
        self.tableViewHeroes.reloadData()
        // Do any additional setup after loading the view, typically from a nib.
    }
}
