//
//  RecipesResultPresenter.swift
//  decooking
//
//  Created by Ivan Morozov on 20.12.2020.
//

import Foundation
import UIKit

protocol IRecipesResultPresenter {
    func didLoad(ui: IRecipesResultView)
    func updateRecipes()
}

class RecipesResultPresenter: BasePresenter<IRecipesResultInteractor, IRecipesResultRouter>, IRecipesResultPresenter {
    private weak var ui: IRecipesResultView?
    private var ingredients: [Ingredient]
    
    init(interactor: IRecipesResultInteractor, router: IRecipesResultRouter, ingredients: [Ingredient]) {
        self.ingredients = ingredients
        super.init(interactor: interactor, router: router)
    }
    
    func didLoad(ui: IRecipesResultView) {
        self.ui = ui
    }
    
    func updateRecipes() {
        guard self.ingredients.count > 0 else { return }
        interactor.getRecipesByIngredients(ingredients: self.ingredients) {
            [] (data: Network.RequestResult<Array<RecipeData>>) in
            switch data {
            case .failure(_): // TODO: обработка ошибок
                break
            case .success(let data):
                var images = [UIImage]()
                var recipes = data
                for recipe in data {
                self.interactor.getPictureByRecipe(recipe: recipe) {
                        (data: Network.RequestResult<UIImage>) in
                        switch data {
                        case .failure(_):
                            break
                        case .success(let data):
                            images.append(data)
                            if images.count == recipes.count {
                                DispatchQueue.main.sync {
                                    self.ui?.set(recipes: recipes, pictures: images)
                                }
                            }
                            break
                        }
                    }
                }
                break
            }
        }
    }
}

