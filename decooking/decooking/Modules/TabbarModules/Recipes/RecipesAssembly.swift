//
//  RecipesAssembly.swift
//  decooking
//
//  Created by Иван Морозов on 05.11.2020.
//

import Foundation

enum RecipesAssembly {
    static func makeModule() -> Module<RecipesPresenter> {
        
        // Router
        let router = RecipesRouter()
        
        // Interactor
        let interactor = RecipesInteractor()
        
        // Presenter
        let presenter = RecipesPresenter(interactor: interactor, router: router)
        
        // Controller
        let controller = RecipesViewController(presenter: presenter, interactor: interactor)
        
        // Setting Depency
        router.viewController = controller
        
        // Setup depency
        return Module<RecipesPresenter>(viewController: controller, presenter: presenter)
    }
}
