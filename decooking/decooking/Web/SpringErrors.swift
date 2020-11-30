//
//  SpringErrors.swift
//  decooking
//
//  Created by Иван Морозов on 26.11.2020.
//

import Foundation

struct SpringErrors: Codable {
    var timestap: String
    var status: Int
    var error: String
    var message: String
    var path: String
}
