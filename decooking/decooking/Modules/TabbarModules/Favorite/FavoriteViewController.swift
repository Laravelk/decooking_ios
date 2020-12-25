//
//  FavoriteViewController.swift
//  decooking
//
//  Created by Ivan Morozov on 24.12.2020.
//

import UIKit

class FavoriteViewController: UIViewController {
    private var favoriteView: FavoriteView = FavoriteView.loadXib()
    private var presenter: IFavoritePresenter
        
    init(presenter: IFavoritePresenter) {
        self.presenter = presenter
        presenter.didLoad(ui: favoriteView)
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        self.view = self.favoriteView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        presenter.updateRecipes()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.topItem?.title = "Favorites"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
