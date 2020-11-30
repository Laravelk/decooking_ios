//
//  SplashInteractor.swift
//  decooking
//
//  Created by Иван Морозов on 24.11.2020.
//

import Foundation

protocol ISplashInteractor {
    var network: Network! { get set }
}

class SplashInteractor: ISplashInteractor {
    var network: Network!
    
    init() {
        self.network = Network()
    }
}
