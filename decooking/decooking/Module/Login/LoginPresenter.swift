//
//  LoginPresenter.swift
//  decooking
//
//  Created by Иван Морозов on 25.10.2020.
//

import Foundation

protocol ILoginPresenter {
    func didLoad(ui: ILoginView)
    var onRegisterPress: (() -> Void)? { get set }
    var onLoginPress: ((String, String) -> Void)? { get set }
    var onForgotPress: (() -> Void)? { get set }
}

class LoginPresenter : BasePresenter<ILoginInteractor, ILoginRouter>, ILoginPresenter {
    var onForgotPress: (() -> Void)?
    var onLoginPress: ((_ email: String, _ password: String) -> Void)?
    var onRegisterPress: (() -> Void)?
    
    private weak var ui: ILoginView?

    func didLoad(ui: ILoginView) {
        self.ui = ui
        
        guard let superRouter = router as? LoginRouter else { return }
        
        ui.onRegisterTapHandler = { [weak superRouter]() in
            superRouter?.routeToScreen(with: .register, data: nil)
        }
        
        ui.onLoginTapHandler = { [weak self] (email, password) in
            guard let router = self?.router else { return }
            var status = self?.interactor.getAuthentication(email, password)
        }
        
        ui.onForgotTapHandler = { [weak superRouter]() in
            superRouter?.routeToScreen(with: .forgot, data: nil)
        }
    }
}

 
