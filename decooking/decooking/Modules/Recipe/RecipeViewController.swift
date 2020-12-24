//
//  RecipeViewController.swift
//  decooking
//
//  Created by Ivan Morozov on 21.12.2020.
//

import UIKit

class RecipeViewController: UIViewController {
    private var recipeView: RecipeView = RecipeView.loadXib()
    private var presenter: IRecipePresenter
    
    init(presenter: IRecipePresenter) {
        self.presenter = presenter
        presenter.didLoad(ui: recipeView)
        recipeView.parseRecipe(recipe: presenter.recipeWithImage)
        super.init(nibName: nil, bundle: nil)
        self.navigationController?.title = "Рецепт"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        guard let view = self.recipeView as? UIView else {
            assertionFailure("Login view is not UIView")
            return
        }
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.didLoad(ui: self.recipeView)
    }
}

