//
//  SearchRouter.swift
//  decooking
//
//  Created by Иван Морозов on 17.12.2020.
//

import UIKit

protocol ISearchRouter {
    
}

class SearchRouter: BaseRouting, ISearchRouter {
    private weak var viewController: UIViewController?
    
    func setViewController(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func routeToScreen(with key: ScreenKey, data: Any?) {
        switch key {
        case .forgot:
            break
        default:
            break
        }
    }
    
    func presentScreen(with key: ScreenKey, data: Any?) {
        //
    }
    
    func exit() {
        // 
    }
    
    
}
