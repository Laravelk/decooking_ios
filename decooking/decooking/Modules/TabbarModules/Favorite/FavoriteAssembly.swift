//
//  FavoriteAssembly.swift
//  decooking
//
//  Created by Ivan Morozov on 24.12.2020.
//

import Foundation

enum FavoriteAssembly {
    static func makeModule(recipes: [String]?) -> Module<FavoritePresenter> {
        
        // Router
        let router = FavoriteRouter()

        // Interactor
        let interactor = FavoriteInteractor()

        // Presenter
        let presenter = FavoritePresenter(interactor: interactor, router: router, recipes: recipes)

        // Controller
        let controller = FavoriteViewController(presenter: presenter)

        // Setup depency
        router.setViewController(viewController: controller)


        return Module<FavoritePresenter>(viewController: controller, presenter: presenter)
    }
}
