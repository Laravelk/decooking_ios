//
//  RegisterViewController.swift
//  decooking
//
//  Created by Иван Морозов on 12.11.2020.
//

import UIKit

class RegisterViewController : UIViewController {
    private var registerView: RegisterView = RegisterView.loadXib()
    private var presenter: IRegisterPresenter
    private var interactor: IRegisterInteractor

    init(presenter: IRegisterPresenter, interactor: IRegisterInteractor) {
        self.presenter = presenter
        self.interactor = interactor
        
        presenter.didLoad(ui: registerView)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = self.registerView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.didLoad(ui: self.registerView)
    }
    
}
