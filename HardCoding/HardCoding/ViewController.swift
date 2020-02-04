//
//  ViewController.swift
//  HardCoding
//
//  Created by Miles Malin on 2/3/20.
//  Copyright © 2020 Miles Malin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dvc = segue.destination as! DetailsViewController
        let button = sender as! UIButton
        if button.titleLabel!.text! == "Charmander" {
            dvc.characterClicked = [
                "name": "Charmander",
                "description": "a pokemon",
                "alignment": "fire type",
            ]
        } else if button.titleLabel!.text! == "Squirtle" {
            dvc.characterClicked = [
                "name": "Squirtle",
                "description": "a pokemon",
                "alignment": "water type",
            ]
        } else if button.titleLabel!.text! == "Bulbasaur" {
        dvc.characterClicked = [
            "name": "Bulbasaur",
            "description": "a pokemon",
            "alignment": "grass type",
        ]
    }

}
    
}
