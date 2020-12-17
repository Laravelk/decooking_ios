//
//  ProfileRouter.swift
//  decooking
//
//  Created by Иван Морозов on 17.12.2020.
//

import Foundation

protocol IProfileRouter {
    
}

class ProfileRouter: BaseRouting, IProfileRouter {
    
    func routeToScreen(with key: ScreenKey, data: Any?) {
        switch key {
        case .login:
            break
        default:
            break
        }
    }
    
    func presentScreen(with key: ScreenKey, data: Any?) {
        switch key {
        case .login:
            break
        default:
            break
        }
    }
    
    func exit() {
        //
    }
    
    
}
