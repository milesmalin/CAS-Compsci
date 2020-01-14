//
//  ViewController.swift
//  AppRememberer
//
//  Created by Miles Malin on 1/7/20.
//  Copyright © 2020 Miles Malin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greetingLabel: UILabel!
    
    @IBOutlet weak var nameEntry: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let existingName: String? = try? String(contentsOf: getNameFileURL())
        greetingLabel.text = "Hello, \(existingName ?? "Eduardo")"
    }

    func getNameFileURL() -> URL{
       
       let documentURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        return documentURL.appendingPathComponent("UserName.txt")
    }
    
    @IBAction func rememberName(_ sender: Any) {
        let name = nameEntry.text!
        try! name.write(to: getNameFileURL(), atomically: true, encoding: .utf8)
        greetingLabel.text = "Hello, \(name)"
    }
    
    @IBAction func forgetName(_ sender: Any) {
        try? FileManager.default.removeItem(at: getNameFileURL())
        greetingLabel.text = "hi"
    }
    
}

