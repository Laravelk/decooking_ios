//
//  LoginAssembly.swift
//  decooking
//
//  Created by Иван Морозов on 29.10.2020.
//

import Foundation

enum LoginAssembly {
    static func makeModule() -> Module<LoginPresenter> {
        // Interactor
        let interactor = LoginInteractor()
        
        // Router
        let router = LoginRouter()
        
        // Presenter
        let presenter = LoginPresenter(interactor: interactor, router: router)
        
        // ViewController
        let loginController = LoginViewController(presenter: presenter)
    
        return Module<LoginPresenter>(viewController: loginController, presenter: presenter)
    }
}
