//
//  SplashRouter.swift
//  decooking
//
//  Created by Иван Морозов on 13.11.2020.
//

import UIKit

protocol ISplashRouter {
    var pushLogin: (() -> Void)! { get set }
    var pushMain: (() -> Void)! { get set }
}

class SplashRouter: ISplashRouter {
    private weak var network: Network!
    
    var pushLogin: (() -> Void)!
    var pushMain: (() -> Void)!
        
    init(network: Network, toLogin: @escaping () -> Void, toMain: @escaping () -> Void) {
        self.network = network
        self.pushLogin = toLogin
        self.pushMain = toMain
    }
    
    func moveToLogin() {
        pushLogin()
    }
    
    func moveToMain() {
        pushMain()
    }
}
