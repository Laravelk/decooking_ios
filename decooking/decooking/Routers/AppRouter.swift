//
//  AppRouter.swift
//  decooking
//
//  Created by Иван Морозов on 18.11.2020.
//

import UIKit

protocol IAppRouter {
    func pushLoginFlow() -> Void
}

class AppRouter: IAppRouter {
    weak var window: UIWindow!
    weak var network: Network!
    var loginFlowRouter: LoginFlowRouter?
    
    init(window: UIWindow, network: Network) {
        self.window = window
        self.network = network
        pushLoginFlow()
    }
    
    func pushLoginFlow() {
        loginFlowRouter = LoginFlowRouter(on: self.window, appRouter: self, network: network)
    }
}   
