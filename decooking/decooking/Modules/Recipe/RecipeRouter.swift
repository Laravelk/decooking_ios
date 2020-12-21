//
//  RecipeRouter.swift
//  decooking
//
//  Created by Ivan Morozov on 21.12.2020.
//

import Foundation

protocol IRecipeRouter {
    
}

class RecipeRouter: BaseRouting, IRecipeRouter {
    func routeToScreen(with key: ScreenKey, data: Any?) {
        switch key {
        default:
            break
        }
    }
    
    func presentScreen(with key: ScreenKey, data: Any?) {
        switch key {
        default:
            break
        }
    }
    
    func exit() {
        // code
    }
    
    
}
