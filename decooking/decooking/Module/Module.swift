//
//  Module.swift
//  decooking
//
//  Created by Иван Морозов on 05.11.2020.
//

import UIKit

public struct Module <PresenterType> {
    let viewController : UIViewController
    let presenter : PresenterType
    
    init(viewController: UIViewController, presenter: PresenterType) {
        self.viewController = viewController
        self.presenter = presenter
    }
}
