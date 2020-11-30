//
//  LoginRouter.swift
//  decooking
//
//  Created by Иван Морозов on 13.11.2020.
//

import UIKit

protocol ILoginRouter {
    
}

class LoginRouter: BaseRouting, ILoginRouter {
    weak var viewController: UIViewController?
    
    func setViewController(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func routeToScreen(with key: ScreenKey, data: Any?) {
        switch key {
        case .register:
            break
        case .recipes:
            break
        default:
            break
        }
    }
    
    func presentScreen(with key: ScreenKey, data: Any?) {
        
    }
    
    func exit() {
        
    }
    
    init() {}
}
