//
//  TabbarAssembly.swift
//  decooking
//
//  Created by Иван Морозов on 06.12.2020.
//

import UIKit

class TabBarModule {
    var controller: UITabBarController & ITabBarViewController
    var presenter: ITabBarPresenter
    
    init(controller: UITabBarController & ITabBarViewController, presenter: ITabBarPresenter) {
        self.controller = controller
        self.presenter = presenter
    }
}

class TabBarAssembly {
    static func makeModule() -> TabBarModule {
        // Router
        let router = TabBarRouter()
        
        // Interactor
        let interactor = TabBarInteractor()
        
        // Presenter
        let presenter = TabBarPresenter(interactor: interactor, router: router)
        
        // View Controller
        let viewController = TabBarViewContoller()
        
        return TabBarModule(controller: viewController, presenter: presenter)
    }
}
