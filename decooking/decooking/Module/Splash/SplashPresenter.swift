//
//  SplashPresenter.swift
//  decooking
//
//  Created by Иван Морозов on 12.11.2020.
//

import Foundation

protocol ISplashPresenter {
    func didLoad(ui: ISplashView)
    func choice()
}

class SplashPresenter: BasePresenter<ISplashInteractor,ISplashRouter>, ISplashPresenter {
    private weak var ui: ISplashView?
    
    func didLoad(ui: ISplashView) {
        self.ui = ui
        
        // Configure
        
        // Subsribe on actions
    }
    
    func choice() {
        router.routeToScreen(with: .login, data: nil)
    }
}
