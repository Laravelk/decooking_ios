//
//  LoginViewController.swift
//  decooking
//
//  Created by Иван Морозов on 27.10.2020.
//

import UIKit

class LoginViewController : UIViewController {
    private var loginView: ILoginView = LoginView.loadXib()
    private var presenter: ILoginPresenter
    private var interactor: ILoginInteractor

    init(presenter: ILoginPresenter, interactor: ILoginInteractor) {
        self.presenter = presenter
        self.interactor = interactor
        presenter.didLoad(ui: loginView)
        super.init(nibName: nil, bundle: nil)
        
        loginView.onLoginTapHandler = { (email, password) in
            let authentication = interactor.getAuthentication(email, password)
            print("hello")
        }
        
        loginView.onForgotTapHandler = {
            
        }
        
        loginView.onRegisterTapHandler = {
            
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        guard let view = self.loginView as? UIView else {
            assertionFailure("Login view is not UIView")
            return
        }
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.didLoad(ui: self.loginView)
    }
    
}
