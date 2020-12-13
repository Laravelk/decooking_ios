//
//  Interactor.swift
//  decooking
//
//  Created by Иван Морозов on 13.12.2020.
//

import Foundation

protocol ITabBarInteractor {
    
}

class TabBarInteractor: ITabBarInteractor {
    var network: Network
    
    init() {
        self.network = Network()
    }
}
