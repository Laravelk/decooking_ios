//
//  AuthenticationData.swift
//  decooking
//
//  Created by Иван Морозов on 11.11.2020.
//

import Foundation

struct AuthenticationData : Codable {
    var answerCode: Int // 1 – почта или пароль неверные, 0 – все хорошо
    var username: String
    var token: String
}
