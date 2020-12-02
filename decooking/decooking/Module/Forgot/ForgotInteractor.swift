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
}
