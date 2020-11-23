//
//  LoginAssembly.swift
//  decooking
//
//  Created by Иван Морозов on 29.10.2020.
//

import Foundation

enum LoginAssembly {
    static func makeModule(network: Network, router: LoginRouter) -> Module<LoginPresenter> {
        let presenter = LoginPresenter(router: router)
        let interactor = LoginInteractor(network: network)
        let loginController = LoginViewController(presenter: presenter, interactor: interactor)
        let loginModule = Module<LoginPresenter>(viewController: loginController, presenter: presenter)
        return loginModule
    }
}
