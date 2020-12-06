//
//  RegisterAssembly.swift
//  decooking
//
//  Created by Иван Морозов on 12.11.2020.
//

import Foundation

enum RegisterAssembly {
    static func makeModule() -> Module<RegisterPresenter> {
        
        // Router
        let router = RegisterRouter()
        
        // Interactor
        let interactor = RegisterInteractor()
        
        // Presenter
        let presenter = RegisterPresenter(interactor: interactor, router: router)
        
        // ViewController
        let controller = RegisterViewController(presenter: presenter)
        
        // Depency setup
        router.setViewController(viewController: controller)
        
        return Module<RegisterPresenter>(viewController: controller, presenter: presenter)
    }
}
