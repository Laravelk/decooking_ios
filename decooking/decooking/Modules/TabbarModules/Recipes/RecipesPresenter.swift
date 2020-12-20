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
    var onSaveIngredients: (() -> Void)? { get set }
}

class RecipesPresenter: BasePresenter<IRecipesInteractor, IRecipesRouter & BaseRouting>, IRecipesPresenter {
    private weak var ui: IRecipesView?
    
    var onSaveIngredients: (() -> Void)?
    var onAddPickedIngredient: ((Ingredient) -> Void)?
    
    func removePickedIngredients(names: [String]?) {
        guard let names = names else { return }
        guard let ui = self.ui else { return }
        ui.removeIngredient(names: names)
    }
    
    func didLoad(ui: IRecipesView) {
        self.ui = ui
        
        ui.onSearch = { [weak self] (part: String) in
            self?.reloadTable(part: part)
        }
        
        ui.onAddPickedIngredient = { [weak self] (ingredient: Ingredient) in
            guard let presenter = self else { return }
            guard let complection = presenter.onAddPickedIngredient else { return }
            complection(ingredient)
        }
        
        ui.onSave = { [weak self, weak router] () in
            guard let presenter = self else { return }
            guard let complection = presenter.onSaveIngredients else { return }
            guard let view = presenter.ui else { return }
            guard let router = router else { return }
            complection()
            router.routeToScreen(with: .recipesSearchResult, data: view.pickedIngredients)
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
