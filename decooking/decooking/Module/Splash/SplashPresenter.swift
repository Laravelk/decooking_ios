//
//  SplashPresenter.swift
//  decooking
//
//  Created by Иван Морозов on 12.11.2020.
//

import Foundation

protocol ISplashPresenter {
    func didLoad(ui: ISplashView)
    func moveToScreen()
    var router: ISplashRouter! { get set }
}

class SplashPresenter {
    private weak var ui: ISplashView?
    var router: ISplashRouter!
    
    init(router: ISplashRouter?) {
        self.router = router
    }
}

extension SplashPresenter: ISplashPresenter {
    func moveToScreen() {
        // use core data
        router.pushLogin()
    }
    
    func didLoad(ui: ISplashView) {
        self.ui = ui
    }
}
