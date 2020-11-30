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

class LoginPresenter : BasePresenter<ILoginInteractor, ILoginRouter>,ILoginPresenter {
    var onForgotPress: (() -> Void)?
    var onLoginPress: ((_ email: String, _ password: String) -> Void)?
    var onRegisterPress: (() -> Void)?
    
    private weak var ui: ILoginView?
    
    override init(interactor: ILoginInteractor, router: ILoginRouter) {
        super.init(interactor: interactor, router: router)
    }

    func didLoad(ui: ILoginView) {
        self.ui = ui
        
        ui.onRegisterTapHandler = { [weak self]() in
            guard let router = self?.router else { return }
        }
        
        ui.onLoginTapHandler = { [weak self] (email, password) in
            guard let router = self?.router else { return }
            self?.interactor.getAuthentication(email, password)
        }
        
        ui.onForgotTapHandler = { [weak self]() in
            guard let router = self?.router else { return }
        }
    }
}

 
