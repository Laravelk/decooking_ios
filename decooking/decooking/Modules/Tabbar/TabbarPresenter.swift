//
//  TabbarPresenter.swift
//  decooking
//
//  Created by Иван Морозов on 06.12.2020.
//

import Foundation

protocol ITabBarPresenter {
//    func didLoad(ui: ITabBarViewController)
}

class TabBarPresenter: ITabBarPresenter {
    var interactor: ITabBarInteractor
    var router: ITabBarRouter
    
    init(interactor: ITabBarInteractor, router: ITabBarRouter) {
        self.interactor = interactor
        self.router = router
    }
}
