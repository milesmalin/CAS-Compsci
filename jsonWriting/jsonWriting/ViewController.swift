//
//  ViewController.swift
//  jsonWriting
//
//  Created by Miles Malin on 1/9/20.
//  Copyright © 2020 Miles Malin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var dateInput: UITextField!
    @IBOutlet weak var EBInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let url = getFileURL() {
         let data = try? Data (contentsOf: url)
            if let data = data {
                let dict = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: String]
                nameInput.text = dict["name"]
                dateInput.text = dict["date"]
                EBInput.text = dict["enemies"]
            }
        }
       
    }
    func getFileURL() -> URL?{
        let docDirectory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
       
        if docDirectory != nil{
            return docDirectory!.appendingPathComponent("savefile.json")
        }
        return nil
    }
  
    
    @IBAction func saveButton(_ sender: Any) {
        let data: [String: String] = [
            "name": nameInput.text ?? "N/A",
            "date": dateInput.text ?? "N/A",
            "enemies": EBInput.text ?? "N/A"
        ]
        let url = getFileURL()
        if let jsonData = try? JSONSerialization.data(withJSONObject: data, options: []){
            try! jsonData.write(to: url!)
        }else {
            print("Saving Failed")
        }
    }
    @IBAction func loadButton(_ sender: Any) {
    }
    
}

