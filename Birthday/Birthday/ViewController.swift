//
//  ViewController.swift
//  Birthday
//
//  Created by Miles Malin on 9/19/19.
//  Copyright © 2019 Miles Malin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var howOld: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var bornYear: UISwitch!
    @IBOutlet weak var birthLabel: UILabel!
    @IBOutlet weak var ageDown: UIButton!
    @IBOutlet weak var ageUp: UIButton!
    @IBOutlet weak var ageDisplay: UILabel!
    
    
    var age = 0
    
    var newAge = 0
    
    var currentYear = 2019
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        howOld.text = "Find your Age"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func agePlusButton(_ sender: UIButton) {
        age += 1
        ageDisplay.text = "\(age)"
    }
    
    @IBAction func ageMinusButton(_ sender: UIButton) {
        age -= 1
        ageDisplay.text = "\(age)"
    }

    @IBAction func yearCalculator(_ sender: UIButton) {
        let BirthLabel = currentYear - age + newAge
        birthLabel.text = "You were born in \(BirthLabel)"
    }
    
    @IBAction func birthSwitch(_ sender: UISwitch) {
        if bornYear.isOn {
            newAge = 0
        } else {
            newAge += 1
        }
        
    }
    
    
    


}

