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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setTabBar()
    }
    
    private func setTabBar() -> Void {
        recipes = RecipesAssembly.makeModule()
        
        guard let recipes = recipes else { return }
        recipes.viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        let viewCont = UIViewController()
        viewCont.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        let viewCont1 = UIViewController()
        viewCont1.tabBarItem = UITabBarItem(tabBarSystemItem: .mostRecent, tag: 2)
        let profile = UIViewController()
        profile.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 3)
        viewControllers = [recipes.viewController, viewCont, viewCont1, profile]
    }
}
