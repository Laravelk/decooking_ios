//
//  LoginPresenter.swift
//  decooking
//
//  Created by Иван Морозов on 25.10.2020.
//

import Foundation

protocol ILoginPresenter {
    func didLoad(ui: ILoginView)
    var router: ILoginRouter! { get set }
    var onRegisterPress: (() -> Void)? { get set }
    var onLoginPress: ((String, String) -> Void)? { get set }
    var onForgotPress: (() -> Void)? { get set }
}

class LoginPresenter : ILoginPresenter {
    var onForgotPress: (() -> Void)?
    var onLoginPress: ((_ email: String, _ password: String) -> Void)?
    var onRegisterPress: (() -> Void)?
    
    private weak var ui: ILoginView?
    
    var router: ILoginRouter!
    var interactor: ILoginInteractor!
    
    init(router: ILoginRouter?, interactor: ILoginInteractor) {
        self.router = router
        self.interactor = interactor
    }

    func didLoad(ui: ILoginView) {
        self.ui = ui
        
        ui.onRegisterTapHandler = { [weak self]() in
            guard let router = self?.router else { return }
            router.pushRegister()
        }
        
        ui.onLoginTapHandler = { [weak self] (email, password) in
            guard let router = self?.router else { return }
            self?.interactor.getAuthentication(email, password)
            router.pushLogin(email: email, password: password)
        }
        
        ui.onForgotTapHandler = { [weak self]() in
            guard let router = self?.router else { return }
            router.pushForgotPassword()
        }
    }
}

 
