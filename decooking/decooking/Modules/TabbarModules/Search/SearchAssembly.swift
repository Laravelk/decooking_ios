//
//  SearchAssembly.swift
//  decooking
//
//  Created by Иван Морозов on 17.12.2020.
//

import Foundation

class SearchAssembly {
    static func makeModule() -> Module<SearchPresenter> {
        // Router
        let router = SearchRouter()
        
        // Interactor
        let interactor = SearchInteractor()
        
        // Presenter
        let presenter = SearchPresenter(interactor: interactor, router: router)
        
        // ViewController
        let viewController = SearchViewController(presenter: presenter)
        
        return Module<SearchPresenter>(viewController: viewController, presenter: presenter)
    }
}
