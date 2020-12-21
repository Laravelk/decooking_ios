//
//  RecipeAssembly.swift
//  decooking
//
//  Created by Ivan Morozov on 21.12.2020.
//

import Foundation

enum RecipeAssembly {
    static func makeModule(recipeWithImage: RecipeDataWithPicture) -> Module<RecipePresenter> {
        // Router
        let router = RecipeRouter()
        
        // Interactor
        let interactor = RecipeInteractor()
        
        // Presenter
        let presenter = RecipePresenter(interactor: interactor, router: router, recipeWithImage: recipeWithImage)
        
        // ViewController
        let viewController = RecipeViewController(presenter: presenter)
        
        return Module<RecipePresenter>(viewController: viewController, presenter: presenter)
    }
    
}
