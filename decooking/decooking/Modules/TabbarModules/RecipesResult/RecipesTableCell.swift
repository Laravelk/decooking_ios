//
//  RecipesTableCell.swift
//  decooking
//
//  Created by Ivan Morozov on 20.12.2020.
//

import UIKit

class RecipesTableCell: UITableViewCell {
    @IBOutlet weak var foodPicture: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var recipeDescription: UILabel!
    
    var recipe: RecipeData?
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(recipe: RecipeData, picture: UIImage) {
        self.title.text = recipe.name
        self.title.font = UIFont.boldSystemFont(ofSize: 20)
        self.recipeDescription.text = recipe.description
        self.foodPicture.image = picture
        self.recipe = recipe
    }
    
}
