//
//  RecipesResultInteractor.swift
//  decooking
//
//  Created by Ivan Morozov on 20.12.2020.
//

import Foundation
import UIKit
import Network

protocol IRecipesResultInteractor: AnyObject {
    func getRecipesByIngredients(ingredients: [Ingredient], complection: @escaping (Network.RequestResult<Array<RecipeData>>) -> Void)
    func getPictureByRecipes(recipes: [RecipeData]) -> [UIImage]
    func getPictureByRecipe(recipe: RecipeData, complection: @escaping ((Network.RequestResult<UIImage>) -> Void))
}

class RecipesResultInteractor: IRecipesResultInteractor {
    func getPictureByRecipe(recipe: RecipeData, complection: @escaping (Network.RequestResult<UIImage>) -> Void) {
        network.getPicture(recipesId: recipe.id, completion: complection)
    }
    
    private var network: Network
    
    init() {
        self.network = Network()
    }
    
    func getRecipesByIngredients(ingredients: [Ingredient], complection: @escaping ((Network.RequestResult<Array<RecipeData>>) -> Void)) {
        var ingredientsId: [String] = [String]()
        for ingredient in ingredients {
            ingredientsId.append(ingredient.id)
        }
        print(ingredientsId)
        network.getRecipes(ingredientsId: ingredientsId, completion: complection)
    }
    
    public func getPictureByRecipes(recipes: [RecipeData]) -> [UIImage] {
        var images: [UIImage] = [UIImage]()
        for recipe in recipes {
            network.getPicture(recipesId: recipe.id) {
                (data: Network.RequestResult<UIImage>) in
                switch data {
                case .failure(_):
                    break
                case .success(let data):
                    images.append(data)
                    print("append images")
                    break
                }
            }
        }
        return images
    }
}


