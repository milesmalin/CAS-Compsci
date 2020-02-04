//
//  recipeThing.swift
//  jsonWriting
//
//  Created by Miles Malin on 2/3/20.
//  Copyright © 2020 Miles Malin. All rights reserved.
//

import Foundation

class recipeThing: Codable {
    init(recipe: String, ingriedients: String, steps: String) {
        self.recipe = recipe
        self.ingriedients = ingriedients
        self.steps = steps
    }
    
    var recipe: String
    var ingriedients: String
    var steps: String
}
