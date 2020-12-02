//
//  LoginAssembly.swift
//  decooking
//
//  Created by Иван Морозов on 29.10.2020.
//

import Foundation

enum LoginAssembly {
    static func makeModule() -> Module<LoginPresenter> {
        // Router
        let router = LoginRouter()
        
        // Interactor
        let interactor = LoginInteractor()
        
        // Presenter
        let presenter = LoginPresenter(interactor: interactor, router: router)
        
        // ViewController
        let controller = LoginViewController(presenter: presenter)
        
        // Dependency Setup
        router.setViewController(viewController: controller)
    
        return Module<LoginPresenter>(viewController: controller, presenter: presenter)
    }
}
