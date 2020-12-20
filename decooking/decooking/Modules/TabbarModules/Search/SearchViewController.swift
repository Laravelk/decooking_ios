//
//  SearchViewController.swift
//  decooking
//
//  Created by Иван Морозов on 17.12.2020.
//

import UIKit

class SearchViewController: UITableViewController {
    private var searchView: SearchView = SearchView.loadXib()
    private var presenter: ISearchPresenter
        
    init(presenter: ISearchPresenter) {
        self.presenter = presenter
        presenter.didLoad(ui: searchView)
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        self.view = self.searchView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.topItem?.title = "Search"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
