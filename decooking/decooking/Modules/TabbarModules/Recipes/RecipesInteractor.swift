//
//  RecipesInteractor.swift
//  decooking
//
//  Created by Иван Морозов on 12.11.2020.
//

import Foundation

protocol IRecipesInteractor: class {
    var network: Network! { get set }
}

class RecipesInteractor: IRecipesInteractor {
    var network: Network!
    
    init() {
        self.network = Network()
    }
}
