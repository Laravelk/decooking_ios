//
//  ForgotViewController.swift
//  decooking
//
//  Created by Иван Морозов on 02.12.2020.
//

import UIKit

class ForgotViewController : UIViewController {
    private var forgotView: ForgotView = ForgotView.loadXib()
    private var presenter: IForgotPresenter

    init(presenter: IForgotPresenter) {
        self.presenter = presenter
        presenter.didLoad(ui: forgotView)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = self.forgotView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.didLoad(ui: self.forgotView)
    }
}
