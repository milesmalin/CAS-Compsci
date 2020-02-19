//
//  ViewController.swift
//  ScrollViewExercise
//
//  Created by Miles Malin on 2/12/20.
//  Copyright © 2020 Miles Malin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if(segue.identifier == "easy") {
                
            }
            

    }
}
  /*      for i in 1...125 {
            let newButon = UIButton()
            newButton.setTitle("x", .normal)
            newButton.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
            stackView.addArrangedSubview(newButton)
        }
        stackView.frame = CGRect(x: 0, y: 0, width: 200, height: 3750)
        scrollView.contentSize = CGSize(width: 200, height: 3750)
    }


}
 */
