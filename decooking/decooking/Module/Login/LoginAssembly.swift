//
//  LoginAssembly.swift
//  decooking
//
//  Created by Иван Морозов on 29.10.2020.
//

import Foundation

enum LoginAssembly {
    static func makeModule() -> LoginModule {
        let presenter = LoginPresenter()
        let viewController = LoginViewController(presenter: presenter)
        let loginModule = LoginModule(viewController: viewController)
        return loginModule
    }
}
