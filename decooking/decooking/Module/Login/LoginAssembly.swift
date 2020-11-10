//
//  LoginAssembly.swift
//  decooking
//
//  Created by Иван Морозов on 29.10.2020.
//

import Foundation

enum LoginAssembly {
    static func makeModule() -> Module<LoginPresenter> {
        let presenter = LoginPresenter()
        let loginController = LoginViewController(presenter: presenter)
        let loginModule = Module<LoginPresenter>(viewController: loginController, presenter: presenter)
        return loginModule
    }
}
