//
//  RegisterAssembly.swift
//  decooking
//
//  Created by Иван Морозов on 12.11.2020.
//

import Foundation

enum RegisterAssembly {
    static func makeModule() -> Module<RegisterPresenter> {
        let presenter = RegisterPresenter()
        let interactor = RegisterInteractor()
        let loginController = RegisterViewController(presenter: presenter, interactor: interactor)
        let loginModule = Module<RegisterPresenter>(viewController: loginController, presenter: presenter)
        return loginModule
    }
}
