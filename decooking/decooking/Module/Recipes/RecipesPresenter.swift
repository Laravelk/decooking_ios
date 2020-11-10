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
}

extension RecipesPresenter: IRecipesPresenter {
    func didLoad(ui: IRecipesView) {
        self.ui = ui
    }
}
