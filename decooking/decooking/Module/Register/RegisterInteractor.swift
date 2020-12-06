//
//  RegisterInteractor.swift
//  decooking
//
//  Created by Иван Морозов on 12.11.2020.
//

import Foundation

protocol IRegisterInteractor {
    var network: Network { get set }
    func registerAccount(username: String, email: String, password: String) -> Bool
}

class RegisterInteractor: IRegisterInteractor {
    var network: Network
    init() {
        self.network = Network()
    }
    
    func registerAccount(username: String, email: String, password: String) -> Bool {
        var status = false
        network.register(username: username, email: email, password: password) { [status]
            (data: Network.RequestResult<RegisterData>) in
            switch data {
            case .failure(let error):
                break
            case .success(let data):
                break
            default:
                break
            }
        }
        return status
    }
    
}
