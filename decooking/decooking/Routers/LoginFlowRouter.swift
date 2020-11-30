//
//  LoginFlowRouter.swift
//  decooking
//
//  Created by Иван Морозов on 23.11.2020.
//

import UIKit

protocol ILoginFlowRouter {
    var window: UIWindow! { get set }
    var network: Network! { get set }
    
    func pushSplash() -> Void
    func pushLogin() -> Void
    func pushMain() -> Void
    func pushRegister() -> Void
    func pushForgot() -> Void
}

class LoginFlowRouter: ILoginFlowRouter {
    var window: UIWindow!
    var network: Network!
    
    unowned var appRouter: AppRouter

    init(on: UIWindow, appRouter: AppRouter, network: Network) {
        self.appRouter = appRouter
        self.window = on
        self.network = network
        pushSplash()
    }
    
    func pushSplash() {
        let splashModule = SplashAssembly.makeModule()
        let firstViewController = splashModule.viewController
        let navigationController = UINavigationController(rootViewController: firstViewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func pushMain() {
    }
    
    func pushForgot() {
        
    }
    
    func pushRegister() {
        let registerModule = RegisterAssembly.makeModule()
        let firstViewController = registerModule.viewController
        let navigationController = UINavigationController(rootViewController: firstViewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func pushLogin() {
//        let loginRouter = LoginRouter()
//        let loginModule = LoginAssembly.makeModule(network: network, router: loginRouter)
//        let firstViewConroller = loginModule.viewController
//        let navigationConroller = UINavigationController(rootViewController: firstViewConroller)
//        window.rootViewController = navigationConroller
//        window.makeKeyAndVisible()
    }
}
