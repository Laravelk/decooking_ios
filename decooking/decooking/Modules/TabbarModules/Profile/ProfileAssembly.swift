//
//  ProfileAssembly.swift
//  decooking
//
//  Created by Иван Морозов on 17.12.2020.
//

import Foundation

class ProfileAssembly {
    static func makeModule() -> Module<ProfilePresenter> {
        // Router
        let router = ProfileRouter()
        
        // Interactor
        let interactor = ProfileInteractor()
        
        // Presenter
        let presenter = ProfilePresenter(interactor: interactor, router: router)
        
        // ViewController
        let viewController = ProfileViewController(presenter: presenter)
        
        return Module<ProfilePresenter>(viewController: viewController, presenter: presenter)
    }
}
