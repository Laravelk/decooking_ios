//
//  ProfileInteractor.swift
//  decooking
//
//  Created by Иван Морозов on 17.12.2020.
//

import Foundation

protocol IProfileInteractor {
}

class ProfileInteractor: IProfileInteractor {
    private var network: Network
    
    init() {
        self.network = Network()
    }
}
