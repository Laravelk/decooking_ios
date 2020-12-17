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
    private var search: Module<SearchPresenter>?
    private var profile: Module<ProfilePresenter>?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setTabBar()
    }
    
    private func setTabBar() -> Void {
        recipes = RecipesAssembly.makeModule()
        search = SearchAssembly.makeModule()
        profile = ProfileAssembly.makeModule()

        guard let recipes = recipes else { return }
        guard let search = search else { return }
        guard let profile = profile else { return }
        
        recipes.viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        recipes.viewController.tabBarItem.title = "recipe"
        search.viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
        profile.viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 3)
        
        recipes.viewController.title = "Recipe"
        search.viewController.title = "Search"
        profile.viewController.title = "Profile"
        
        let viewCont1 = UIViewController()
        viewCont1.tabBarItem = UITabBarItem(tabBarSystemItem: .mostRecent, tag: 2)
        viewControllers = [recipes.viewController, search.viewController, viewCont1, profile.viewController]
    }
}
