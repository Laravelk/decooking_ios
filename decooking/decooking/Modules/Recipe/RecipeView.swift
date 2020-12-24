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
    @IBOutlet weak var nationalityTitle: UILabel!
    @IBOutlet weak var nationalityLabel: UILabel!
    @IBOutlet weak var raitingLabel: UILabel!
    @IBOutlet weak var waysToCookTitle: UILabel!
    @IBOutlet weak var waysToCookLabel: UILabel!
    @IBOutlet weak var caloriLabel: UILabel!
    @IBOutlet weak var ingredientsLabel: UILabel!
    @IBOutlet weak var ingredientsTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func parseRecipe(recipe: RecipeDataWithPicture) {
        self.image.image = recipe.picture
        
        self.title.font = UIFont.systemFont(ofSize: 20.0, weight: .bold)
        self.title.text = recipe.recipe.name
        
        self.descriptionLabel.text = "Описание: "
        self.descriptionLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        self.descriptionTextLabel.text = recipe.recipe.description
        
        self.nationalityTitle.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        self.nationalityTitle.text = "Национальность: "
        self.nationalityLabel.text = recipe.recipe.dishNationality.name
        
        self.raitingLabel.text = "Рейтинг: \(String (recipe.recipe.rating))"
        
        self.waysToCookTitle.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        self.waysToCookTitle.text = "Способы приготовить: "
        var allWays = ""
        for way in recipe.recipe.waysToCook {
            let wayName = way.name
            allWays = allWays + wayName + "\n"
        }
        self.waysToCookLabel.text = allWays
        
        self.caloriLabel.text = "Количество каллорий: \(recipe.recipe.calories)"
        
        self.ingredientsTitle.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        self.ingredientsTitle.text = "Ингредиенты: "
        
        var allIngredients: String = ""
        for ingredient in recipe.recipe.ingredientFromRecipes {
            let name: String = ingredient.ingredientTypeName
            let amount: String = String(ingredient.amount)
            let measureName: String = ingredient.measure.name
            allIngredients = allIngredients + name + " " + measureName + " " + amount + "\n"
        }
        self.ingredientsLabel.text = allIngredients
        
    }
    
    
}
