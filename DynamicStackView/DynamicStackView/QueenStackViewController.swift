//
//  QueenStackViewController.swift
//  DynamicStackView
//
//  Created by Miles Malin on 2/6/20.
//  Copyright © 2020 Miles Malin. All rights reserved.
//

import UIKit

class QueenStackViewController: UIViewController {
    
    var imageCount = 5
    var coolImage: UIImageView? = nil
    @IBOutlet weak var nobelStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let images = (1...imageCount).map({ (X) -> UIImageView in
            let image = "moon"
            let newImage = UIImage(named: image)
            let imageView = UIImageView(image: newImage)
            return imageView
        })
        for coolImage in images {
            coolImage.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
            nobelStackView.addArrangedSubview(coolImage)
            let constraint = NSLayoutConstraint(item: coolImage, attribute: .height, relatedBy: .equal, toItem: images[0], attribute: .height, multiplier: 1, constant: 1)
            nobelStackView.addConstraint(constraint)
            //let image: UIImage = UIImage(named: "moon")!
            //self.coolImage = UIImageView(image: image)
            //self.view.addSubview(coolImage)
            
            
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

