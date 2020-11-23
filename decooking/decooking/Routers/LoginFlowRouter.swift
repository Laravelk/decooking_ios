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
        let loginCompletion: () -> Void = { [weak self] in
            self?.pushLogin()
        }
        
        let mainCompletion: () -> Void = { [weak self] in
            self?.pushMain()
        }
        
        let splashRouter = SplashRouter(network: self.network, toLogin: loginCompletion, toMain: mainCompletion)
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
        let register: () -> Void = { [weak self] in
            guard let router = self else {
                return
            }
            router.pushRegister()
        }
        
        let forgotPassword: () -> Void = { [weak self] in
            guard let router = self else {
                return
            }
            
            router.pushForgot()
        }
        
        let wasLoged: (String, String) -> Void = { [weak self] (email, password) in
            guard let router = self else {
                return
            }
            
            router.pushLogin()
        }
        
        let loginRouter = LoginRouter(toRegister: register, toForgotPassword: forgotPassword, toLogin: wasLoged)
        
        let loginModule = LoginAssembly.makeModule(network: network, router: loginRouter)
        let firstViewConroller = loginModule.viewController
        let navigationConroller = UINavigationController(rootViewController: firstViewConroller)
        window.rootViewController = navigationConroller
        window.makeKeyAndVisible()
    }
    
    
}
