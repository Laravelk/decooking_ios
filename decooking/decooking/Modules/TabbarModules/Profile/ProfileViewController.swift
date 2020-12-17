//
//  ProfileViewController.swift
//  decooking
//
//  Created by Иван Морозов on 17.12.2020.
//

import UIKit

class ProfileViewController: UIViewController {
    private var profileView: ProfileView = ProfileView.loadXib()
    private var presenter: IProfilePresenter
        
    init(presenter: IProfilePresenter) {
        self.presenter = presenter
        presenter.didLoad(ui: profileView)
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        self.view = self.profileView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.topItem?.title = "Profile"

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
