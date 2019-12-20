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
        
        // Do any additional setup after loading the view.
        //for i in 1...planets!.count{
        //let planet = planets![i]
        //  let url: URL = URL(string: "\(planet)")
        //let url = "https://swapi.co/api/\(newMovie ?? 0)/"
        let url: URL = URL(string: "https://swapi.co/api/films/\(newMovie ?? 0)/")!
        //let planet = URLComponents(string: url)?.queryItems
        //let param1 = planet?.filter({$0.name == "param1"}).first
        let responseData: Data? = try? Data(contentsOf: url)
        if let responseData = responseData {
            let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
            if let json = json {
                let dictionary: [String: Any]? = json as? [String: Any]
                if let dictionary = dictionary {
                    let title: String? = dictionary["title"] as? String
                    let planet: String? = dictionary["planets"] as? String
                    let species: String? = dictionary["species"] as? String
                    if let title2:String = title,
                        let planet2:String = planet,
                        let species2:String = species {
                        nameLabel.text = "The Star wars film \(title2), has the planets \(planet2) in it and has these charcters \(species2)."
                    }
                    
                }else { print("response data failed 3")}
                
            }else { print("response data failed 2")}
            
        } else { print("response data failed")}
    }
}



/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */

