//
//  SplashRouter.swift
//  decooking
//
//  Created by Иван Морозов on 13.11.2020.
//

import UIKit

protocol ISplashRouter {
    var pushLoginRouter: (() -> Void)? { get set }
    var pushMainRouter: (() -> Void)? { get set}
}

class SplashRouter: ISplashView {
    private weak var network: Network?
    
    var pushLoginRouter: (() -> Void)?
    var pushMainRouter: (() -> Void)?
    
    init(network: Network, toLogin: @escaping () -> Void, toMain: @escaping () -> Void) {
        self.network = network
        self.pushMainRouter = toMain
        self.pushLoginRouter = toLogin
        
        // Если пользователь не заходил в приложение, то логин
        // Если пользователь заходил в приложение, то основной экран
        guard let loginClosure = pushLoginRouter else { return }
        guard let mainClosure = pushMainRouter else { return }
        loginClosure()
    }
}
