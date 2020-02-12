//
//  ViewController.swift
//  FunButton
//
//  Created by Miles Malin on 2/11/20.
//  Copyright © 2020 Miles Malin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var WhateverButton: NamedButton!
    
    @IBOutlet weak var OkButton: NamedButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        WhateverButton.name = "Whatever"
        OkButton.name = "Ok"
    }
    
    @IBAction func buttonPress(_ sender: Any) {
        let message: String
        if let sender = sender as? NamedButton {
            message = "hello my name is \(sender.name)"
        } else {
            message = "hello idk who I am"
        }
        let alert = UIAlertController(title: "click me", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
}

