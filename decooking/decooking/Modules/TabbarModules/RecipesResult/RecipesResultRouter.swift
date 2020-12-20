//
//  RecipesResultRouter.swift
//  decooking
//
//  Created by Ivan Morozov on 20.12.2020.
//

import Foundation

protocol IRecipesResultRouter {
    
}

class RecipesResultRouter : BaseRouting, IRecipesResultRouter {
    func routeToScreen(with key: ScreenKey, data: Any?) {
        // code
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
