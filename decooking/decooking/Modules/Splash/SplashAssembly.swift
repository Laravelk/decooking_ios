//
//  SplashAssembly.swift
//  decooking
//
//  Created by Иван Морозов on 12.11.2020.
//

import UIKit

enum SplashAssembly {
    static func makeModule(on: UIWindow?) -> Module<SplashPresenter> {
        // Router
        let router = SplashRouter(on: on)
        
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
