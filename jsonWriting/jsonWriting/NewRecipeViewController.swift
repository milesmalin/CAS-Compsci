//
//  NewRecipeViewController.swift
//  jsonWriting
//
//  Created by Miles Malin on 2/3/20.
//  Copyright © 2020 Miles Malin. All rights reserved.
//

import UIKit

class NewRecipeViewController: UIViewController {

        @IBOutlet weak var recipeList: UILabel!
        @IBOutlet weak var ingriedients: UITextField!
        
        @IBOutlet weak var recipes: UITextField!
        
        @IBOutlet weak var steps: UITextField!
        
        var selectedItem: recipeThing? = nil
        var recipeData: [recipeThing] = []
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            
            recipeList.text = selectedItem?.recipe
            ingriedients.text = selectedItem?.ingriedients
            steps.text = selectedItem?.steps

            // Do any additional setup after loading the view.
        }
        
        
        override func viewWillDisappear(_ animated: Bool) {
            if let selectedItem = selectedItem {
                selectedItem.ingriedients = ingriedients.text ?? "no"
                selectedItem.steps = steps.text ?? "no"
                selectedItem.recipe = recipes.text ?? "no"
            }
            saveRecipe()
        }
        
        
        
        
        
        
        func saveRecipe() {
            if let url = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false), let data = try? JSONEncoder().encode(recipeData) {
                do {
                    try data.write(to: url.appendingPathComponent("recipes.json"))
                } catch {
                    print("Failed to save")
                }
            } else {
                print("Could not prepare save")
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
