//
//  RecipesRouter.swift
//  decooking
//
//  Created by Ivan Morozov on 20.12.2020.
//

import UIKit

protocol IRecipesRouter {
    func setViewController(viewController: UIViewController)
}

class RecipesRouter: IRecipesRouter, BaseRouting {
    weak var viewController: UIViewController?
    
    func setViewController(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func routeToScreen(with key: ScreenKey, data: Any?) {
        var destination: UIViewController? = nil

        switch key {
        case .recipesSearchResult:
            guard let ingredients = data as? [Ingredient] else { return }
            let module = RecipesResultAssembly.makeModule(ingredients: ingredients)
            destination = module.viewController
            break
        default:
            break
        }
        
        
        guard let viewController = self.viewController else { return }
        guard let destinationVC = destination else { return }
        viewController.navigationController?.pushViewController(destinationVC, animated: false)
    }
    
    func presentScreen(with key: ScreenKey, data: Any?) {
        // code
    }
    
    func exit() {
        //
    }
    
    private var network = Network()
}
