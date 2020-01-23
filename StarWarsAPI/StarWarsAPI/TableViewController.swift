//
//  TableViewController.swift
//  StarWarsAPI
//
//  Created by Miles Malin on 12/18/19.
//  Copyright © 2019 Miles Malin. All rights reserved.
//

import UIKit





class TableViewController: UITableViewController {
   
    func getTitle(movieNum: Int) -> String {
        let url: URL = URL(string:"https://swapi.co/api/films/\(movieNum + 1)/")!
        let responseData: Data? = try? Data(contentsOf: url)
        if let responseData = responseData {
            let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
            if let json = json {
                let dictionary: [String: Any]? = json as? [String: Any]
                if let dictionary = dictionary {
                    let planetList = dictionary["planets"] as! [String]
                    let epID = dictionary["episode_id"] as! Int
                    
                    movieList[epID] = planetList
                    
                    let title: String = dictionary["title"] as! String
                    return title
                }
            }
        }
        return "off"
    }
    
    var movieList: [Int: [String]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 7
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StarWars", for: indexPath)
        
        let title = getTitle(movieNum: indexPath.row)
        cell.textLabel!.text = title
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let dest = segue.destination as! ViewControllerStarWars
        
        if let indexPath = self.tableView.indexPathForSelectedRow{
            
            dest.newMovie = indexPath.row
            
            dest.planets = movieList[indexPath.row + 1]
                
      
            
            print(movieList)
        }
        
    }
    
    
    
    
    
    
    
}
