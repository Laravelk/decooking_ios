//
//  RecipesViewController.swift
//  decooking
//
//  Created by Иван Морозов on 05.11.2020.
//

import UIKit

class RecipesViewController : UIViewController {
    private var recepiesView: RecipesView = RecipesView.loadXib()
    private var presenter: IRecipesPresenter
    private var interactor: IRecipesInteractor

    init(presenter: IRecipesPresenter, interactor: IRecipesInteractor) {
        self.presenter = presenter
        self.interactor = interactor
        
        presenter.didLoad(ui: recepiesView)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = self.recepiesView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.didLoad(ui: self.recepiesView)
    }
}
