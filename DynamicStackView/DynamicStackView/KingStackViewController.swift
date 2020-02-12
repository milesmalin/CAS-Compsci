//
//  KingStackViewController.swift
//  DynamicStackView
//
//  Created by Miles Malin on 2/6/20.
//  Copyright © 2020 Miles Malin. All rights reserved.
//

import UIKit

class KingStackViewController: UIViewController {

    var labelCount = 5;
    @IBOutlet weak var lordStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let labels = (1...labelCount).map({ (X) in UILabel() })
        for label in labels {
            label.text = "Hello World"
            lordStackView.addArrangedSubview(label)
            let constraint = NSLayoutConstraint(item: label, attribute: .height, relatedBy: .equal, toItem: labels[0], attribute: .height, multiplier: 1, constant: 1)
            if label != labels[0] {
                lordStackView.addConstraint(constraint)
            }
        }
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
