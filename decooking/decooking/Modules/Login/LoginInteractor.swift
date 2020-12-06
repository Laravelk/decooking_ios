//
//  LoginInteractor.swift
//  decooking
//
//  Created by Иван Морозов on 12.11.2020.
//

import Foundation
import Network

protocol ILoginInteractor {
    var network: Network { get set }
    func getAuthentication(_ email: String, _ password: String, _ completion: @escaping (Network.RequestResult<AuthenticationData>) -> Void)
}

class LoginInteractor: ILoginInteractor {
    var network: Network
    
    init() {
        self.network = Network()
    }
    
    func getAuthentication(_ email: String, _ password: String, _ completion: @escaping (Network.RequestResult<AuthenticationData>) -> Void) {
            self.network.getAuthentication(email: email, password: password) {
                (requestData: Network.RequestResult<AuthenticationData>) in
                DispatchQueue.main.async() {
                    completion(requestData)
            }
        }
    }
}
