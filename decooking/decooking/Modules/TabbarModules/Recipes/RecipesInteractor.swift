//
//  RecipesInteractor.swift
//  decooking
//
//  Created by Иван Морозов on 12.11.2020.
//

import Foundation

protocol IRecipesInteractor: class {
    var network: Network! { get set }
    func getIngredients(part: String, complection: @escaping (Network.RequestResult<Array<Ingredient>>) -> Void)
}

class RecipesInteractor: IRecipesInteractor {
    
    func getIngredients(part: String, complection: @escaping (Network.RequestResult<Array<Ingredient>>) -> Void) {
        network.getIngredients(part: part, completion: complection)
    }
    
    var network: Network!
    
    init() {
        self.network = Network()
    }
    
}
