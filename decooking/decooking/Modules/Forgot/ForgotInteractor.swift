//
//  ForgotInteractor.swift
//  decooking
//
//  Created by Иван Морозов on 02.12.2020.
//

import UIKit
import Network

protocol IForgotInteractor {
    func resetPassword(_: String, _: @escaping (Network.RequestResult<ForgotData>) -> Void) -> Void
}

class ForgotInteractor: IForgotInteractor {
    var network: Network
    init() {
        self.network = Network()
    }
    
    // TODO: будем обрабатывать отдельно успехи и неудачи
    // TODO: обработать возвращаемые данные
    func resetPassword(_ email: String, _ completion: @escaping (Network.RequestResult<ForgotData>) -> Void) -> Void {
        network.resetPassword(email: email) {
                (requestData: Network.RequestResult<ForgotData>) in
                DispatchQueue.main.async() {
                    completion(requestData)
            }
        }
    }
}
