//
//  LoginInteractor.swift
//  decooking
//
//  Created by Иван Морозов on 12.11.2020.
//

import Foundation

protocol ILoginInteractor {
    var network: Network? { get set }
    func getAuthentication(_ email: String, _ password: String) -> AuthenticationData
}

class LoginInteractor: ILoginInteractor {
    var network: Network?
    
    init(network: Network) {
        self.network = network
    }
    
    func getAuthentication(_ email: String, _ password: String) -> AuthenticationData {
        return AuthenticationData(answer: 2, username: "f", token: "Fdsfds") // TODO: function
    }
}
