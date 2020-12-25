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
    private var favorite: Module<FavoritePresenter>?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setTabBar()
    }
    
    private func setTabBar() -> Void {
        tabBar.tintColor = .systemOrange
        
        recipes = RecipesAssembly.makeModule()
        search = SearchAssembly.makeModule()
        profile = ProfileAssembly.makeModule()
        favorite = FavoriteAssembly.makeModule(recipes: [])

        guard let recipes = self.recipes else { return }
        guard let search = self.search else { return }
        guard let profile = self.profile else { return }
        guard let favorite = self.favorite else { return }
        
        recipes.viewController.tabBarItem = UITabBarItem(title: "Recipe", image: UIImage(named: "fork"), tag: 0)
        recipes.viewController.tabBarItem.title = "recipe"
        
        search.viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
        
        favorite.viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)
        
        profile.viewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "user"), tag: 3)
        
        recipes.viewController.title = "Recipe"
        search.viewController.title = "Search"
        profile.viewController.title = "Profile"
        viewControllers = [recipes.viewController, search.viewController, favorite.viewController, profile.viewController]
    }
}
