//
//  ForgotInteractor.swift
//  decooking
//
//  Created by Иван Морозов on 02.12.2020.
//

import UIKit

protocol IForgotInteractor {}

class ForgotInteractor: IForgotInteractor {
    var network: Network
    init() {
        self.network = Network()
    }
    
    // TODO: будем обрабатывать отдельно успехи и неудачи
    // TODO: обработать возвращаемые данные
    func resetPassword(email: String) -> Bool {
        var status = false
        network.resetPassword(email: email) { [status] (data: Network.RequestResult<ForgotData>) in
            switch data {
            case .failure(let error):
                break
            case .success(let data):
                break
            default:
                break
            }
        }
        return true
    }
}
