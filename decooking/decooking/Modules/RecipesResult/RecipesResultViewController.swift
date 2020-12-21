//
//  RecipesResultViewController.swift
//  decooking
//
//  Created by Ivan Morozov on 20.12.2020.
//

import UIKit

class RecipeResultViewController: UIViewController {
    private var recepiesResultView: RecipesResultView = RecipesResultView.loadXib()
    private var presenter: IRecipesResultPresenter
        
    init(presenter: IRecipesResultPresenter) {
        self.presenter = presenter
        presenter.didLoad(ui: recepiesResultView)
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        self.view = self.recepiesResultView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.updateRecipes()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
