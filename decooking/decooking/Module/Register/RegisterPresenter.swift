//
//  RegisterPresenter.swift
//  decooking
//
//  Created by Иван Морозов on 12.11.2020.
//

import Foundation

protocol IRegisterPresenter {
    func didLoad(ui: IRegisterView)
}

class RegisterPresenter: BasePresenter<IRegisterInteractor, IRegisterRouter> {
    private weak var ui: IRegisterView?
}

extension RegisterPresenter: IRegisterPresenter {
    func didLoad(ui: IRegisterView) {
        self.ui = ui
        
        guard let superRouter = super.router as? RegisterRouter else { return }
        guard let interactor = super.interactor as? RegisterInteractor else { return }
        
        ui.onBack = { [weak superRouter]() in
            superRouter?.routeToScreen(with: .login, data: nil)
        }
        
        ui.onRegister = { [weak superRouter, weak interactor](username: String, email: String, password: String) in
            var status = interactor?.registerAccount(username: username, email: email, password: password)
            // if true
            superRouter?.routeToScreen(with: .login, data: nil)
        }
        
    }
}
