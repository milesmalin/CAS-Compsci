//
//  ViewController.swift
//  ScrollViewExercise
//
//  Created by Miles Malin on 2/12/20.
//  Copyright © 2020 Miles Malin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberButton: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func easyButton(_ sender: Any) {
        return numberButton = 10
    }
    
    @IBAction func mediumButton(_ sender: Any) {
        return numberButton = 50
    }
    
    @IBAction func hardButton(_ sender: Any) {
        return numberButton = 150
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? GameViewController
        vc?.number = numberButton
    }
    
    
}
