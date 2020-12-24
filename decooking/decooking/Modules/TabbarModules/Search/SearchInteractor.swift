//
//  SearchInteractor.swift
//  decooking
//
//  Created by Иван Морозов on 17.12.2020.
//

import UIKit

protocol ISearchInteractor {
    func getRecipeByName(recipeName: String, complection: @escaping (Network.RequestResult<Array<RecipeData>>) -> Void)
}

class SearchInteractor: ISearchInteractor {
    
    private var network: Network
    
    init() {
        self.network = Network()
    }
    
    func getRecipeByName(recipeName: String, complection: @escaping (Network.RequestResult<Array<RecipeData>>) -> Void) {
        
    }
}
