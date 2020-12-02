//
//  ForgotAssembly.swift
//  decooking
//
//  Created by Иван Морозов on 02.12.2020.
//

import Foundation

enum ForgotAssembly {
    static func makeModule() -> Module<ForgotPresenter> {
        // Router
        let router = ForgotRouter()
        
        // Interactor
        let interactor = ForgotInteractor()
        
        // Presenter
        let presenter = ForgotPresenter(interactor: interactor, router: router)
        
        // ViewController
        let controller = ForgotViewController(presenter: presenter)
        
        // Dependency Setup
        router.setViewController(viewController: controller)
    
        return Module<ForgotPresenter>(viewController: controller, presenter: presenter)
    }
}
