//
//  RecipeView.swift
//  decooking
//
//  Created by Ivan Morozov on 21.12.2020.
//

import UIKit

protocol IRecipeView: AnyObject {
    func parseRecipe(recipe: RecipeDataWithPicture)
}

class RecipeView: UIView, IRecipeView {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionTextLabel: UILabel!
    @IBOutlet weak var nationalityLabel: UILabel!
    @IBOutlet weak var raitingLabel: UILabel!
    @IBOutlet weak var waysToCookLabel: UILabel!
    @IBOutlet weak var caloriLabel: UILabel!
    @IBOutlet weak var ingredientsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func parseRecipe(recipe: RecipeDataWithPicture) {
        self.image.image = recipe.picture
        self.title.text = recipe.recipe.name
        self.descriptionLabel.text = "Описание"
        self.descriptionTextLabel.text = recipe.recipe.description
        self.nationalityLabel.text = recipe.recipe.dishNationality.name
        self.raitingLabel.text = String(recipe.recipe.rating)
//        self.waysToCookLabel.text = recipe.recipe.waysToCook[0].name
        self.caloriLabel.text = String(recipe.recipe.calories)
        
        var allIngredients: String = ""
        for ingredient in recipe.recipe.ingredientFromRecipes {
            var name: String = ingredient.ingredientTypeName
            var amount: String = String(ingredient.amount)
            var measureName: String = ingredient.measure.name
            allIngredients = allIngredients + name + " " + measureName + " " + amount + "\n"
        }
        self.ingredientsLabel.text = allIngredients
        
    }
    
    
}
