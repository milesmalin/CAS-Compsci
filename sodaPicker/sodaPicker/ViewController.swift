//
//  ViewController.swift
//  sodaPicker
//
//  Created by Miles Malin on 10/21/19.
//  Copyright © 2019 Miles Malin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sodaFlavors.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sodaFlavors[row]
    }
    
    @IBOutlet weak var sodaPicker: UIPickerView!
    @IBOutlet weak var label: UILabel!
   
    let sodaFlavors = ["Cola", "Orange soda", "Grape soda", "Rootbeer"]
    let prices = ["$1.00", "$1.50", "$2.00", "$2.50"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func placeOrder(_ sender: Any) {
        let row = sodaPicker.selectedRow(inComponent: 0)
        label.text = "You ordered a "+sodaFlavors[row] + " it costs "+prices[row]
    }
    
}

