//
//  ViewController.swift
//  XRDS Dictionary
//
//  Created by Miles Malin on 11/5/19.
//  Copyright © 2019 Miles Malin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var vocabWord:String?
    var vocabDefinition:String?
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleDefinition: UILabel!
    

    override func viewDidLoad() {
        titleLabel.text = vocabWord
        titleDefinition.text = vocabDefinition
        
        super.viewDidLoad()

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
