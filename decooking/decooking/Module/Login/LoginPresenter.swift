//
//  LoginPresenter.swift
//  decooking
//
//  Created by Иван Морозов on 25.10.2020.
//

import Foundation

protocol ILoginPresenter {
    func didLoad(ui: ILoginView)
}

class LoginPresenter {
    private weak var ui: ILoginView?
}

extension LoginPresenter: ILoginPresenter {
    func didLoad(ui: ILoginView) {
        self.ui = ui
    }
}

 
