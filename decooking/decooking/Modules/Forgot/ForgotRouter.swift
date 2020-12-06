//
//  ForgotRouter.swift
//  decooking
//
//  Created by Иван Морозов on 02.12.2020.
//

import UIKit

protocol IForgotRouter {}

class ForgotRouter: IForgotRouter, BaseRouting {
    var viewController: UIViewController?
    func setViewController(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func routeToScreen(with key: ScreenKey, data: Any?) {
        guard let viewController = self.viewController else { return }
        
        switch key {
        case .login:
            viewController.navigationController?.popViewController(animated: true)
            break
        default:
            break
        }
    }
    
    func presentScreen(with key: ScreenKey, data: Any?) {
        
    }
    
    func exit() {
        
    }
    
    
}
