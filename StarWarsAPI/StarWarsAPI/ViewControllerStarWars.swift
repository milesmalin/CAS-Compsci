//
//  ViewControllerStarWars.swift
//  StarWarsAPI
//
//  Created by Miles Malin on 12/18/19.
//  Copyright © 2019 Miles Malin. All rights reserved.
//

import UIKit

class ViewControllerStarWars: UIViewController {
    
    var newMovie: Int?
    
    var planets: [String]?
    
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
   
            
            
            
            override func viewDidLoad() {
                super.viewDidLoad()
                
                
                let url: URL = URL(string: "https://swapi.co/api/films/\((newMovie!) + 1)")!
                let responseData: Data? = try? Data(contentsOf: url)
                if let responseData = responseData {
                    let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
                    if let json = json {
                        let dictionary: [String: Any]? = json as? [String: Any]
                        if let dictionary = dictionary {
                            let title: String? = dictionary["title"] as? String
                            let director: String? = dictionary["director"] as? String
                            let release_date: String? = dictionary["release_date"] as? String
                            if let title2:String = title,
                                let director2:String = director,
                                let release_date2:String = release_date {
                                nameLabel.text = "This film \(title2), was directed by \(director2) and came out on \(release_date2)."
                            }
                            
                        }
                        
                    }
                    
                }
    }
}



