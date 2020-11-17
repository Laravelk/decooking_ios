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

class RegisterPresenter {
    private weak var ui: IRegisterView?
}

extension RegisterPresenter: IRegisterPresenter {
    func didLoad(ui: IRegisterView) {
        self.ui = ui
    }
}
