//
//  LoginRouter.swift
//  decooking
//
//  Created by Иван Морозов on 13.11.2020.
//

import UIKit

protocol ILoginRouter {}

class LoginRouter: BaseRouting, ILoginRouter {
    
    weak var viewController: UIViewController?
    weak var window: UIWindow?
    
    init(on: UIWindow?) {
        self.window = on
    }
    
    func setViewController(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func routeToScreen(with key: ScreenKey, data: Any?) {
        guard let viewController = self.viewController else { return }
        var destinationVC: UIViewController? = nil
        var destinationTVC: UITabBarController? = nil

        switch key {
        case .forgot:
            let module = ForgotAssembly.makeModule()
            destinationVC = module.viewController
        case .register:
            let module = RegisterAssembly.makeModule()
            destinationVC = module.viewController
        case .tabbar:
            let module = TabBarAssembly.makeModule()
            destinationTVC = module.controller
        default:
            break
        }
        
        if let destination = destinationVC {
            viewController.navigationController?.pushViewController(destination, animated: false)
        }
        if let destination = destinationTVC {
            let firstViewController = destination
            window?.rootViewController = firstViewController
        }
    }
    
    func presentScreen(with key: ScreenKey, data: Any?) {
        
    }
    
    func exit() {
        
    }
}
