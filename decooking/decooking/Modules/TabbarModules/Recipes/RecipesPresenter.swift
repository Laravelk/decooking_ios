//
//  RecipesPresenter.swift
//  decooking
//
//  Created by Иван Морозов on 05.11.2020.
//

import Foundation

protocol IRecipesPresenter {
    func didLoad(ui: IRecipesView)
}

class RecipesPresenter {
    private weak var ui: IRecipesView?
    private weak var interactor: IRecipesInteractor!
    
    init(interactor: IRecipesInteractor) {
        self.interactor = interactor
    }
}

extension RecipesPresenter: IRecipesPresenter {
    func didLoad(ui: IRecipesView) {
        self.ui = ui
        
        ui.onSearch = { [weak self] (part: String) in
            print("search")
            self?.reloadTable(part: part)
        }
    }
}

private extension RecipesPresenter {
    func reloadTable(part: String) {
        self.interactor.getIngredients(part: part) {
            (data: Network.RequestResult<Array<Ingredient>>) in
                    switch data {
                    case .failure(_):
                        break
                    case .success(let rdata):
                        DispatchQueue.main.async() {
                            self.ui?.set(ingredients: rdata)
                        }
                        break
                    }
        }
    }
}
