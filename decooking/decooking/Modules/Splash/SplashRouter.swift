//
//  SplashRouter.swift
//  decooking
//
//  Created by Иван Морозов on 13.11.2020.
//

import UIKit

protocol ISplashRouter: BaseRouting {
    
}

class SplashRouter: ISplashRouter {
    weak var viewController: UIViewController?
    weak var window: UIWindow?
    
    func setViewController(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    init(on: UIWindow?) {
        self.window = on
    }
    
    func routeToScreen(with key: ScreenKey, data: Any?) {
        guard let viewController = self.viewController else { return }
        
        var destinationVC: UIViewController? = nil
        var destinationTVC: UITabBarController? = nil
        
        switch key {
        case .login:
            let module = LoginAssembly.makeModule(on: self.window)
            destinationVC = module.viewController
        case .tabbar:
            let module = TabBarAssembly.makeModule()
            destinationTVC = module.controller
        default:
            break
        }
        
        if  let destination = destinationVC {
        viewController.navigationController?.pushViewController(destination, animated: false)
        }
        if let destination = destinationTVC {
            let firstViewController = destination
            window?.rootViewController = firstViewController
        }
    }
    
    func presentScreen(with key: ScreenKey, data: Any?) {
        switch key {
        case .login:
            let module = LoginAssembly.makeModule(on: window)
            viewController?.present(module.viewController, animated: false, completion: nil)
        default:
            break
        }
    }
    
    func exit() {
        
    }
}

