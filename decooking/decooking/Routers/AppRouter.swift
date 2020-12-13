//
//  AppRouter.swift
//  decooking
//
//  Created by Иван Морозов on 30.11.2020.
//

import UIKit

protocol IAppRouter: class {

}

class AppRouter: BaseRouting {
    weak var window: UIWindow? = nil
    weak var viewController: UIViewController? = nil
    
    init(on: UIWindow) {
        self.window = on
        self.routeToScreen(with: .splash, data: nil)
    }
    
    func setViewController(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func routeToScreen(with key: ScreenKey, data: Any?) {
        var destinationVC: UIViewController? = nil
        switch key {
        case .splash:
            let splashModule = SplashAssembly.makeModule(on: window)
            destinationVC = splashModule.viewController
        default:
            break
        }
        
        guard let window = self.window else { return }
        guard let destination = destinationVC else { return }
        let navigationController = UINavigationController(rootViewController: destination)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        guard let splashController = destination as? SplashViewController else { return }
        splashController.presenter.choice()
    }
    
    func presentScreen(with key: ScreenKey, data: Any?) {

    }
    
    func exit() {
        
    }
    
}
