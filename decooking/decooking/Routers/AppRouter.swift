//
//  AppRouter.swift
//  decooking
//
//  Created by Иван Морозов on 18.11.2020.
//

import UIKit

protocol IAppRouter {
    func pushLoginFlow() -> Void
}

class AppRouter: IAppRouter {
    weak var window: UIWindow!
    weak var network: Network!
    var loginFlowRouter: LoginFlowRouter?
    
    init(window: UIWindow, network: Network) {
        self.window = window
        self.network = network
        pushLoginFlow()
    }
    
    func pushLoginFlow() {
        loginFlowRouter = LoginFlowRouter(on: self.window, appRouter: self, network: network)
    }
}

class newAppRouter: BaseRouting {
    weak var viewController: UIViewController? = nil
    weak var window: UIWindow!
    
    init(on: UIWindow) {
        self.window = on
    }
    
    func setViewController(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func routeToScreen(with key: ScreenKey, data: Any?) {
        
        var destinationVC: UIViewController? = nil
        
        switch key {
        case .splash:
            let splashModule = SplashAssembly.makeModule()
            destinationVC = splashModule.viewController
            break
        case .recipes:
            break
        default:
            break
        }
        
        guard let destination = destinationVC else { return }
        guard let source = viewController else { return }
        
        source.navigationController?.pushViewController(destination, animated: true)
    }
    
    func presentScreen(with key: ScreenKey, data: Any?) {
        
    }
    
    func exit() {
        
    }
    
}
