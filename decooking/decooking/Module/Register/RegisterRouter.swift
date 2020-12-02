//
//  RegisterRouter.swift
//  decooking
//
//  Created by Иван Морозов on 13.11.2020.
//

import UIKit


protocol IRegisterRouter {
    
}

class RegisterRouter : IRegisterRouter, BaseRouting {
    var viewController: UIViewController?
    
    func setViewController(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func routeToScreen(with key: ScreenKey, data: Any?) {
        
    }
    
    func presentScreen(with key: ScreenKey, data: Any?) {
    
    }
    
    func exit() {
        
    }
    
    init() {
        
    }
}
