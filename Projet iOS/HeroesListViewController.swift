//
//  HeroesListViewController.swift
//  Projet iOS
//
//  Created by Walid Braham on 27/12/2018.
//  Copyright © 2018 Walid Braham. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class HeroesListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let URL_GET_DATA = "https://simplifiedcoding.net/demos/marvel/"

    
    @IBOutlet weak var tableview: UITableView!
    
    var heroes = [Hero]()
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return heroes.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        
        //getting the hero for the specified position
        let hero: Hero
        hero = heroes[indexPath.row]
        
        //displaying values
        cell.heroName.text = hero.name
        cell.heroTeam.text = hero.team
        
        
        //displaying image
        Alamofire.request(hero.imageUrl!).responseImage { response in
            debugPrint(response)
            
            if let image = response.result.value {
                cell.heroImage.image = image
            }
        }
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        // Do any additional setup after loading the view.
    }
    
    func fetchData() {
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
    
    //displaying data in tableview
    self.tableview.reloadData()
    }
    
    }
    
    self.tableview.reloadData()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
