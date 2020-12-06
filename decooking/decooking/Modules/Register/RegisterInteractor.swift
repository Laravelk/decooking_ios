//
//  RegisterInteractor.swift
//  decooking
//
//  Created by Иван Морозов on 12.11.2020.
//

import Foundation
import Network

protocol IRegisterInteractor {
    var network: Network { get set }
    func registerAccount(username: String, email: String, password: String, completion: @escaping (Network.RequestResult<RegisterData>) -> Void) -> Void
}

class RegisterInteractor: IRegisterInteractor {
    var network: Network
    init() {
        self.network = Network()
    }
    
    func registerAccount(username: String, email: String, password: String, completion: @escaping (Network.RequestResult<RegisterData>) -> Void) -> Void {
        network.register(username: username, email: email, password: password) { (data: Network.RequestResult<RegisterData>) in
            completion(data)
        }
    }
    
}
