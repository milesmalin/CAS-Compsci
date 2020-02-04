//
//  DetailsViewController.swift
//  HardCoding
//
//  Created by Miles Malin on 2/3/20.
//  Copyright © 2020 Miles Malin. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var detailsTextView: UITextView!
    var characterClicked = [
        "name": "Charmander",
        "description": "a pokemon",
        "alignment": "good"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        detailsTextView.text = "\(characterClicked["name"] ?? "somebody") is \(characterClicked["description"] ?? "a mystery"). They are \(characterClicked["alignment"] ?? "fine")"
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
