//
//  ForgotPresenter.swift
//  decooking
//
//  Created by Иван Морозов on 02.12.2020.
//

import UIKit

protocol IForgotPresenter {
    func didLoad(ui: IForgotView)
}

class ForgotPresenter: BasePresenter<IForgotInteractor, IForgotRouter> {
    private weak var ui: IForgotView?
}

extension ForgotPresenter: IForgotPresenter {
    func didLoad(ui: IForgotView) {
        self.ui = ui
        
        guard let superRouter = super.router as? ForgotRouter else { return }
        guard let superInteractor = super.interactor as? ForgotInteractor else { return }
        
        ui.onSend = {[weak superRouter, weak superInteractor] (email: String) in
            superInteractor?.resetPassword(email: email)
            // TODO: обработка ошибок
            superRouter?.presentScreen(with: .login, data: nil)
        }
        
        ui.onBack = { [weak superRouter] in
            superRouter?.routeToScreen(with: .login, data: nil)
        }
    }
}
