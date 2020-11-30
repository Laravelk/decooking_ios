//
//  SplashAssembly.swift
//  decooking
//
//  Created by Иван Морозов on 12.11.2020.
//

import Foundation

enum SplashAssembly {
    static func makeModule() -> Module<SplashPresenter> {
        // Router
        let router = SplashRouter()
        
        // Interactor
        let interactor = SplashInteractor()
        
        // Presenter
        let presenter = SplashPresenter(interactor: interactor, router: router)
        
        // ViewConroller + View
        let controller = SplashViewController(presenter: presenter)
        
        // Dependency Setup
        router.setViewController(viewController: controller)
        
        return Module<SplashPresenter>(viewController: controller, presenter: presenter)
    }
}
