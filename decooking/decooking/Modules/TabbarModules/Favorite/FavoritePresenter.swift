//
//  FavoritePresenter.swift
//  decooking
//
//  Created by Ivan Morozov on 24.12.2020.
//

import Foundation
import UIKit

protocol IFavoritePresenter {
    func didLoad(ui: IFavoriteView)
    func updateRecipes()
}

class FavoritePresenter: BasePresenter<IFavoriteInteractor, IFavoriteRouter & BaseRouting>, IFavoritePresenter {
    private weak var ui: IFavoriteView?
    private var idRecipes: [String]!
    
    init(interactor: IFavoriteInteractor, router: BaseRouting & IFavoriteRouter, recipes: [String]?) {
        super.init(interactor: interactor, router: router)
        idRecipes = [String]()
    }
    
    func didLoad(ui: IFavoriteView) {
        self.ui = ui
        ui.onRecipe = { [weak self](recipe: RecipeData, image: UIImage) in
            let recipeWithImage: RecipeDataWithPicture = RecipeDataWithPicture(recipe: recipe, picture: image)
            guard let presenter = self else { return }
            presenter.router.routeToScreen(with: .recipe, data: recipeWithImage)
        }
        
    }
    
    func updateRecipes() {
        guard self.idRecipes.count > 0 else { return }
//        interactor.getRecipesByIngredients(ingredients: self.ingredients) {
//            [] (data: Network.RequestResult<Array<RecipeData>>) in
//            switch data {
//            case .failure(_): // TODO: обработка ошибок
//                break
//            case .success(let data):
//                var images = [UIImage]()
//                var recipes = data
//                for recipe in data {
//                self.interactor.getPictureByRecipe(recipe: recipe) {
//                        (data: Network.RequestResult<UIImage>) in
//                        switch data {
//                        case .failure(_):
//                            break
//                        case .success(let data):
//                            images.append(data)
//                            if images.count == recipes.count {
//                                DispatchQueue.main.sync {
//                                    self.ui?.set(recipes: recipes, pictures: images)
//                                }
//                            }
//                            break
//                        }
//                    }
//                }
//                break
//            }
//        }
    }
}

