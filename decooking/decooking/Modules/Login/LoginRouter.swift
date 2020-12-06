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
        guard let viewController = self.viewController else { return }
        var destinationVC: UIViewController? = nil

        switch key {
        case .forgot:
            let module = ForgotAssembly.makeModule()
            destinationVC = module.viewController
        case .register:
            let module = RegisterAssembly.makeModule()
            destinationVC = module.viewController
        case .recipes:
            let module = RecipesAssembly.makeModule()
            destinationVC = module.viewController
        default:
            break
        }
        
        guard let destination = destinationVC else { return }
        viewController.navigationController?.pushViewController(destination, animated: false)
    }
    
    func presentScreen(with key: ScreenKey, data: Any?) {
        
    }
    
    func exit() {
        
    }
    
    init() {}
}
