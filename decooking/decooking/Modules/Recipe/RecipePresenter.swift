//
//  RecipePresenter.swift
//  decooking
//
//  Created by Ivan Morozov on 21.12.2020.
//

import Foundation

protocol IRecipePresenter {
    func didLoad(ui: IRecipeView)
    var recipeWithImage: RecipeDataWithPicture { get set }
}

class RecipePresenter: BasePresenter<IRecipeInteractor, IRecipeRouter & BaseRouting>, IRecipePresenter {
    private weak var ui: IRecipeView?
    var recipeWithImage: RecipeDataWithPicture
    
    init(interactor: IRecipeInteractor, router: BaseRouting & IRecipeRouter, recipeWithImage: RecipeDataWithPicture) {
        self.recipeWithImage = recipeWithImage
        super.init(interactor: interactor, router: router)
    }

    func didLoad(ui: IRecipeView) {
        self.ui = ui
    }
    
    
}
