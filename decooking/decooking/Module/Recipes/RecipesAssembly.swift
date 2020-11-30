//
//  RecipesAssembly.swift
//  decooking
//
//  Created by Иван Морозов on 05.11.2020.
//

import Foundation

enum RecipesAssembly {
    static func makeModule(network: Network/*, router: IRecepiesRouter*/) -> Module<RecipesPresenter> {
        let presenter = RecipesPresenter()
        let interactor = RecipesInteractor(network: network)
        let loginController = RecipesViewController(presenter: presenter, interactor: interactor)
        let loginModule = Module<RecipesPresenter>(viewController: loginController, presenter: presenter)
        return loginModule
    }
}
