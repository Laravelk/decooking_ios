//
//  SplashRouter.swift
//  decooking
//
//  Created by Иван Морозов on 13.11.2020.
//

import UIKit

protocol ISplashRouter {
    
}

class SplashRouter: BaseRouting, ISplashRouter {
    weak var viewController: UIViewController?
    
    func setViewController(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func routeToScreen(with key: ScreenKey, data: Any?) {
        guard let viewController = self.viewController else { return }
        
        var destinationVC: UIViewController? = nil
        
        switch key {
        case .login:
            let module = LoginAssembly.makeModule()
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
}

