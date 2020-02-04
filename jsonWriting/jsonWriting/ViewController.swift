//
//  ViewController.swift
//  jsonWriting
//
//  Created by Miles Malin on 1/9/20.
//  Copyright © 2020 Miles Malin. All rights reserved.
//

import UIKit
    
   class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
       
     
        var recipeData: [recipeThing] = []

        @IBOutlet weak var recipePicker: UIPickerView!
        
        @IBOutlet weak var recipeList: UILabel!
        
        @IBOutlet weak var ingriedientsList: UILabel!
        
        @IBOutlet weak var stepsList: UILabel!
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            
            recipePicker.delegate = self
            recipePicker.dataSource = self
           
            
            if let oldData = load() {
                recipeData = oldData
            } else {
                for i in 0...5 {
                    let recipe = ["Recipe a", "Recipe b", "Recipe c", "Recipe d", "Recipe e", "Recipe f"][i]
        recipeData.append(recipeThing(recipe:recipe, ingriedients: "none", steps:"none"))
                }
            }
            
        }
        
        
        
        
        
        
        
        
        
        
        
        
        func load() ->[recipeThing]? {
            if let url = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false), let data = try? Data(contentsOf: url.appendingPathComponent("recipes.json")) {
                let recipeData = try? JSONDecoder().decode([recipeThing].self, from: data)
                return recipeData
            }
            return nil
        }
        
        

        override func viewWillAppear(_ animated: Bool){
        pickerView(recipePicker, didSelectRow: recipePicker.selectedRow(inComponent: 0), inComponent: 0)
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let destination = segue.destination as? NewRecipeViewController {
                destination.recipeData = recipeData
                let itemIndex = recipePicker.selectedRow(inComponent: 0)
                destination.selectedItem = recipeData[itemIndex]
            }
        }
        
        
        
        
        
        
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
            
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return recipeData.count
        }

        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return " \(recipeData[row].recipe)"
        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            let recipeThing = recipeData[row]
            recipeList.text = recipeThing.recipe
            ingriedientsList.text = recipeThing.ingriedients
            stepsList.text = recipeThing.steps
        }



    }
