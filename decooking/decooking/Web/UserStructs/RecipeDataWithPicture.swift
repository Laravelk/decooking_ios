//
//  RecipeDataWithPicture.swift
//  decooking
//
//  Created by Ivan Morozov on 20.12.2020.
//

import Foundation
import UIKit

class RecipeDataWithPicture {
    internal init(recipe: RecipeData, picture: UIImage) {
        self.recipe = recipe
        self.picture = picture
    }
    
    var recipe: RecipeData
    var picture: UIImage
}
