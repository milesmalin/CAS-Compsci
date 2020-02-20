//
//  GameViewController.swift
//  ScrollViewExercise
//
//  Created by Miles Malin on 2/19/20.
//  Copyright © 2020 Miles Malin. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    
    var number: Int?
    
    var realNum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        realNum = Int.random(in: 1...number!)
        for i in 1...number! {
            let newButton = newButtonClass()
            newButton.setTitle("\(i)", for: .normal)
            newButton.setTitleColor(.black, for: .normal)
            newButton.frame = CGRect(x: 0, y: 0, width: 400, height: number!)
            newButton.backgroundColor = UIColor(red: 4, green: 0, blue: 3, alpha: 0)
            stackView.addArrangedSubview(newButton)
            newButton.num = i
            
            
            if newButton.num == realNum {
                newButton.addTarget(self, action: #selector(correct), for: .touchUpInside)
            } else if newButton.num > realNum {
                newButton.addTarget(self, action: #selector(alertHigh), for: .touchUpInside)
            } else if newButton.num < realNum {
                newButton.addTarget(self, action: #selector(alertLow), for: .touchUpInside)
            }
            
        }
        stackView.frame = CGRect(x: 0, y: 0, width: 400, height: number!*75)
        scrollView.contentSize = CGSize(width: 400, height: number!*75)
        
    }
    
    @objc func alertLow() {
        let alert = UIAlertController(title: "WRONG", message: "Guess Higher", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Quit", style: .default, handler: {(_) in return}))
        
        
        self.present(alert, animated: true, completion: {})
    }
    
    @objc func alertHigh() {
        let alert = UIAlertController(title: "WRONG", message: "Guess Lower", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Quit", style: .default, handler: {(_) in return}))
        
        
        self.present(alert, animated: true, completion: {})
    }
    
    @objc func correct() {
        let alert = UIAlertController(title: "Correct!", message: "You Got it Right!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Quit", style: .default, handler: {(_) in return}))
        
        self.present(alert, animated: true, completion: {})
    }
    
    class newButtonClass: UIButton {
        var num = 0
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
