//
//  RecipesResultRouter.swift
//  decooking
//
//  Created by Ivan Morozov on 20.12.2020.
//

import UIKit

protocol IRecipesResultRouter {
    func setViewController(viewController: UIViewController)
}

class RecipesResultRouter : BaseRouting, IRecipesResultRouter {
    weak var viewController: UIViewController?
    
    func setViewController(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func routeToScreen(with key: ScreenKey, data: Any?) {
        var destination: UIViewController? = nil

        switch key {
        case .recipe:
            guard let recipeWithImage = data as? RecipeDataWithPicture else { return }
            let module = RecipeAssembly.makeModule(recipeWithImage: recipeWithImage)
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
        switch key {
        case .recipe:
            break
        default:
            break
        }
    }
    
    func exit() {
        // code
    }
    
    
}
