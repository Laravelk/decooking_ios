//
//  FavoriteAssembly.swift
//  decooking
//
//  Created by Ivan Morozov on 24.12.2020.
//

import Foundation

enum FavoriteAssembly {
    static func makeModule(ingredients: [Ingredient]) -> Module<RecipesResultPresenter> {
        
        // Router
        let router = RecipesResultRouter()
        
        // Interactor
        let interactor = RecipesResultInteractor()
        
        // Presenter
        let presenter = RecipesResultPresenter(interactor: interactor, router: router, ingredients: ingredients)
        
        // Controller
        let controller = RecipeResultViewController(presenter: presenter)
        
        // Setup depency
        router.setViewController(viewController: controller)
        
        
        return Module<RecipesResultPresenter>(viewController: controller, presenter: presenter)
    }
}
