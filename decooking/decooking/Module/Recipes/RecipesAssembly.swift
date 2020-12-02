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
//        let router = RecipesRouter()
        
        // Presenter
        let presenter = RecipesPresenter()
        
        // Interactor
        let interactor = RecipesInteractor()
        
        // Controller
        let controller = RecipesViewController(presenter: presenter, interactor: interactor)
        
        // Setup depency
        return Module<RecipesPresenter>(viewController: controller, presenter: presenter)
    }
}
