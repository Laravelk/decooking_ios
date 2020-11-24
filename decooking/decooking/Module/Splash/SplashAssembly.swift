//
//  SplashAssembly.swift
//  decooking
//
//  Created by Иван Морозов on 12.11.2020.
//

import Foundation

enum SplashAssembly {
    static func makeModule(network: Network, router: ISplashRouter) -> Module<SplashPresenter> {
        let presenter = SplashPresenter(router: router)
        let interactor = SplashInteractor(network: network)
        let controller = SplashViewController(presenter: presenter, interactor: interactor)
        let splashModule = Module<SplashPresenter>(viewController: controller, presenter: presenter)
        return splashModule
    }
}
