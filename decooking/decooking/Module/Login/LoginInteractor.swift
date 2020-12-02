//
//  LoginInteractor.swift
//  decooking
//
//  Created by Иван Морозов on 12.11.2020.
//

import Foundation

protocol ILoginInteractor {
    var network: Network { get set }
    func getAuthentication(_ email: String, _ password: String) -> Bool
}

class LoginInteractor: ILoginInteractor {
    var network: Network
    
    init() {
        self.network = Network()
    }
    
    func getAuthentication(_ email: String, _ password: String) -> Bool {
        var status = false
        network.getAuthentication(email: email, password: password) { [status]
            (data: Network.RequestResult<AuthenticationData>) in
        }
        return true
    }
}
