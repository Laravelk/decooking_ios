//
//  RecipesResultAssembly.swift
//  decooking
//
//  Created by Ivan Morozov on 20.12.2020.
//

import Foundation

enum RecipesResultAssembly {
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
        return Module<RecipesResultPresenter>(viewController: controller, presenter: presenter)
    }
}
