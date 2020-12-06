//
//  Presenter.swift
//  decooking
//
//  Created by Иван Морозов on 30.11.2020.
//

import Foundation

class BasePresenter<Interactor, Router> {
    let interactor: Interactor
    let router: Router
    
    init(interactor: Interactor, router: Router) {
        self.interactor = interactor
        self.router = router
    }
}
