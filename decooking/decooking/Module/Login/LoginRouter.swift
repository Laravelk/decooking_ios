//
//  LoginRouter.swift
//  decooking
//
//  Created by Иван Морозов on 13.11.2020.
//

import Foundation

protocol ILoginRouter {
    var onRegister: (() -> Void)? { get set }
    var onForgotPassword: (() -> Void)? { get set }
    var onLogin: ((String, String) -> Void)? { get set }
    
    func pushRegister() -> Void
    func pushForgotPassword() -> Void
    func pushLogin(email : String, password : String) -> Void
}

class LoginRouter: ILoginRouter {
    var onRegister: (() -> Void)?
    var onForgotPassword: (() -> Void)?
    var onLogin: ((String, String) -> Void)?
    
    init(toRegister: @escaping () -> Void, toForgotPassword: @escaping () -> Void, toLogin: @escaping (String, String) -> Void) {
        self.onRegister = toRegister
        self.onForgotPassword = toForgotPassword
        self.onLogin = toLogin
    }
    
    func pushLogin(email: String, password: String) {
        guard let login = self.onLogin else { return }
        login(email, password)
    }
    
    func pushForgotPassword() {
        guard let forgot = self.onForgotPassword else { return }
        forgot()
    }
    
    func pushRegister() {
        guard let register = self.onRegister else { return }
        register()
    }
    
}
