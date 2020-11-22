//
//  AppRouter.swift
//  decooking
//
//  Created by Иван Морозов on 18.11.2020.
//

import UIKit

protocol IAppRouter {
    func showLogin()
    func showMain()
}

class AppRouter {
    weak var window: UIWindow?
    weak var network: Network?
    var splashRouter: ISplashRouter?
    
    init(window: UIWindow, network: Network) {
        self.window = window
        self.network = network
        pushSplashRouter()
    }
}

extension AppRouter: IAppRouter {
    func pushSplashRouter() {
        guard let network = self.network else { return }
        let onLogin: () -> Void = { [weak self] in
            self?.showLogin()
        }
        
        let onMain: () -> Void = { [weak self] in
            self?.showMain()
        }
        let splashRouter: SplashRouter = SplashRouter(network: network, toLogin: onLogin, toMain: onMain)
        }
    
    func showMain() {
        // тут будет создаваться основной роутер
    }
    
    func showLogin() {
        guard let window = self.window else { return }
        guard let network = self.network else { return }
        let loginModule = LoginAssembly.makeModule(network: network)
        let firstViewConroller = loginModule.viewController
        let navigationConroller = UINavigationController(rootViewController: firstViewConroller)
        window.rootViewController = navigationConroller
        window.makeKeyAndVisible()
    }
    
    
}
