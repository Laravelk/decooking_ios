//
//  LoginViewController.swift
//  decooking
//
//  Created by Иван Морозов on 27.10.2020.
//

import UIKit

class LoginViewController : UIViewController {
    private var loginView: LoginView = LoginView.loadXib()
    private var presenter: ILoginPresenter

    init(presenter: ILoginPresenter) {
//        loginView.onLoginTapHandler = { _ in
//            var login: String  = loginView.loginField.text ?? "login"
//            var password: String = loginView.passwordField.text ?? "password"
//        }
        self.presenter = presenter
        presenter.didLoad(ui: loginView)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = self.loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.didLoad(ui: self.loginView)
    }
    
}
