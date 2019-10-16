//
//  ViewController.swift
//  pizzaPicker
//
//  Created by Miles Malin on 10/16/19.
//  Copyright © 2019 Miles Malin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pizzaFlavors.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pizzaFlavors[row]
    }
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var pizzaPicker: UIPickerView!
    
    
    let pizzaFlavors = ["Vegan", "Vegana", "végétalienne", "veganistisch"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func placeOrder(_ sender: Any) {
        let row = pizzaPicker.selectedRow(inComponent: 0)
        label.text = "You ordered a: "+pizzaFlavors[row]
    }
    
    
}

