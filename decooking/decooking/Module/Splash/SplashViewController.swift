//
//  SplashViewController.swift
//  decooking
//
//  Created by Иван Морозов on 12.11.2020.
//

import UIKit

class SplashViewController : UIViewController {
    private var splashView: SplashView = SplashView.loadXib()
    private var presenter: ISplashPresenter
    private var interactor: ISplashInteractor

    init(presenter: ISplashPresenter, interactor: ISplashInteractor) {
        self.presenter = presenter
        self.interactor = interactor
        
        presenter.didLoad(ui: splashView)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = self.splashView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.didLoad(ui: self.splashView)
    }
    
}
