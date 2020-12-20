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
                DispatchQueue.main.sync {
                    var images = [UIImage]()
                    DispatchQueue.global().sync {
                        images.append(contentsOf: self.interactor.getPictureByRecipes(recipes: data))
                    }
                    self.ui?.set(recipes: data, pictures: images)
                }
                break
            }
        }
    }
}

