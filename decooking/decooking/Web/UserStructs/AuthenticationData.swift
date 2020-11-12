//
//  AuthenticationData.swift
//  decooking
//
//  Created by Иван Морозов on 11.11.2020.
//

import Foundation

struct AuthenticationData : Decodable {
    var answer: Int // true is 1, false is 0
    var username: String
    var token: String
}
