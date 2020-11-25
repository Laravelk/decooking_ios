//
//  LoginAssembly.swift
//  decooking
//
//  Created by Иван Морозов on 29.10.2020.
//

import Foundation

enum LoginAssembly {
    static func makeModule(network: Network, router: ILoginRouter) -> Module<LoginPresenter> {
        let interactor = LoginInteractor(network: network)
        let presenter = LoginPresenter(router: router, interactor: interactor)
        let loginController = LoginViewController(presenter: presenter)
        let loginModule = Module<LoginPresenter>(viewController: loginController, presenter: presenter)
        return loginModule
    }
}
