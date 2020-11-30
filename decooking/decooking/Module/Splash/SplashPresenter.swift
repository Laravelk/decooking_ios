//
//  SplashPresenter.swift
//  decooking
//
//  Created by Иван Морозов on 12.11.2020.
//

import Foundation

protocol ISplashPresenter {
    func didLoad(ui: ISplashView)
}

class SplashPresenter: BasePresenter<ISplashInteractor, ISplashRouter>, ISplashPresenter {
    private weak var ui: ISplashView?
    
    override init(interactor: ISplashInteractor, router: ISplashRouter) {
        super.init(interactor: interactor, router: router)
    }
    
    func didLoad(ui: ISplashView) {
        self.ui = ui
    }
}
