//
//  SplashRouter.swift
//  decooking
//
//  Created by Иван Морозов on 13.11.2020.
//

import UIKit

enum firstWindow {
    case Main // если мы уже залогинены
    case Login
}

protocol ISplashRouter {
    func show(on: UIWindow)
    func showLogin()
    func showMain()
}

class SplashRouter: ISplashView {
    private weak var window: UIWindow?
    private weak var network: Network?
    
    init(network: Network) {
        self.network = network
        // check cache
    }
    
    func show(on window: UIWindow) {
        self.window = window
        
        // тут будем решать, что показывать дальше
        // сейчас просто показываем Login
        
        self.showLogin()
    }
    
    func showLogin() {
        guard let window = self.window else {
            return
        }
        guard let network = self.network else {
            return
        }
    
        let loginModule = LoginAssembly.makeModule(network: self.network!)
        let viewController = loginModule.viewController
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func showMain() {
        // code
    }
}
