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
    }
    
    
}
