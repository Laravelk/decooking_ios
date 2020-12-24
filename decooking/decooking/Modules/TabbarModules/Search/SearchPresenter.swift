//
//  SearchPresenter.swift
//  decooking
//
//  Created by Иван Морозов on 17.12.2020.
//

import Foundation

protocol ISearchPresenter {
    func didLoad(ui: ISearchView)

}

class SearchPresenter: BasePresenter<ISearchInteractor, ISearchRouter>, ISearchPresenter {
    private weak var view: ISearchView?
    
    func didLoad(ui: ISearchView) {
        self.view = ui
        
//        self.view?.onSearchBarChanged = { [] (search: String) in
//            interactor.getRecipeByName(recipeName: search) {
//                (data: Network.RequestResult<Array<RecipeData>>) in
//                        switch data {
//                        case .failure(_):
//                            break
//                        case .success(let rdata):
//                            DispatchQueue.main.async() {
//                                self.ui?.set(ingredients: rdata)
//                            }
//                            break
//                        }
//            }
//        }
    }
    
    
}
