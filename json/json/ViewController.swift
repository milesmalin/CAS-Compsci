//
//  ViewController.swift
//  json
//
//  Created by Miles Malin on 12/16/19.
//  Copyright © 2019 Miles Malin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var jsonFileData: Data?
    var jsonFileString: String?
    
    // TODO: Come up with a better UI than just a single boring label.
    @IBOutlet weak var myLabel: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
         let fileUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        jsonFileData = try? Data(contentsOf: fileUrl!)
       

           let json = try? JSONSerialization.jsonObject(with:jsonFileData!, options: [])
        
        let dictionary: [String: Any]? = json as? [String: Any]
        
        var name = "placeholder"
        var hobbies = ["placeholder"]
        var age = 0
        var favoriteColor = "placeholder"
        
        
        if let data = jsonFileData {
           
          
            name = dictionary!["name"] as! String
            hobbies = dictionary!["hobbies"] as! [String]
            age = dictionary!["age"] as! Int
            
            favoriteColor = dictionary!["favoriteColor"] as! String
            

        }
        myLabel.text = ("Hello, my name is \(name). I am \(age) years old. My favorite color is \(favoriteColor), and my hobbies include: \(hobbies.joined(separator:",")).")
        
       
        
        

    }
    
}
