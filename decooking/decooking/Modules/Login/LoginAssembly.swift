//
//  LoginAssembly.swift
//  decooking
//
//  Created by Иван Морозов on 29.10.2020.
//

import UIKit

enum LoginAssembly {
    static func makeModule(on: UIWindow?) -> Module<LoginPresenter> {
        // Router
        let router = LoginRouter(on: on)
        
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
