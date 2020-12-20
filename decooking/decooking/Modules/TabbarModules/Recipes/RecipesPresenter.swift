//
//  RecipesPresenter.swift
//  decooking
//
//  Created by Иван Морозов on 05.11.2020.
//

import Foundation

protocol IRecipesPresenter {
    func didLoad(ui: IRecipesView)
    var onAddPickedIngredient: ((Ingredient) -> Void)? { get set }
}

class RecipesPresenter: IRecipesPresenter {
    private weak var ui: IRecipesView?
    private weak var interactor: IRecipesInteractor!
    var onAddPickedIngredient: ((Ingredient) -> Void)?

    
    init(interactor: IRecipesInteractor) {
        self.interactor = interactor
    }
    
    func didLoad(ui: IRecipesView) {
        self.ui = ui
        
        ui.onSearch = { [weak self] (part: String) in
            print("search")
            self?.reloadTable(part: part)
        }
        
        ui.onAddPickedIngredient = { [weak self] (ingredient: Ingredient) in
            guard let presenter = self else { return }
            guard let complection = presenter.onAddPickedIngredient else { return }
            complection(ingredient)
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
