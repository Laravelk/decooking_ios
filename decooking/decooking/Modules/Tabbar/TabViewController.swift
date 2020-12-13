//
//  TabViewController.swift
//  decooking
//
//  Created by Иван Морозов on 06.12.2020.
//

import UIKit

protocol ITabBarViewController {
}

class TabBarViewContoller: UITabBarController, ITabBarViewController {
    private var recipes: Module<RecipesPresenter>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTabBar()
    }
    
    private func setTabBar() -> Void {
        recipes = RecipesAssembly.makeModule()
        
        guard let recipes = recipes else { return }
        viewControllers = [recipes.viewController, UIViewController()]
    }
}
