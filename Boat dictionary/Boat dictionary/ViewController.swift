//
//  ViewController.swift
//  Boat dictionary
//
//  Created by Miles Malin on 11/14/19.
//  Copyright © 2019 Miles Malin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //var boat:Boat?
    
    @IBOutlet weak var boatNameLabel: UILabel!
    @IBOutlet weak var boatColorLabel: UILabel!
    @IBOutlet weak var boatPowerLabel: UILabel!
    @IBOutlet weak var boatSizeLabel: UILabel!
    
    var boatName:String = ""
    var boatColor:String = ""
    var boatPower:String = ""
    var boatSize:String = ""
   
    override func viewDidLoad() {
        super.viewDidLoad()
        boatNameLabel.text = boatName
        boatColorLabel.text = boatColor
        boatPowerLabel.text = boatPower
        boatSizeLabel.text = boatSize
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
