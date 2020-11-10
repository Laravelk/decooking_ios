//
//  LoginView.swift
//  decooking
//
//  Created by Иван Морозов on 27.10.2020.
//

import UIKit

protocol ILoginView : AnyObject {
    var onLoginTapHandler: (() -> Void)? { get set }
    var onForgotTapHandler: (() -> Void)? { get set }
    var onRegisterTapHandler: (() -> Void)? { get set }
}


class LoginView: UIView, ILoginView {
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var register: UIButton!
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var entrance: UIButton!
    @IBOutlet weak var forgotPassword: UIButton!
    @IBOutlet weak var passwordField: UITextField!
    
    var onLoginTapHandler: (() -> Void)?
    var onForgotTapHandler: (() -> Void)?
    var onRegisterTapHandler: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.loginField.placeholder = "Введите пароль или логин"
        self.loginField.layer.cornerRadius = 20
        self.loginField.borderStyle = UITextField.BorderStyle.roundedRect

        self.passwordField.textColor = .black
        self.passwordField.placeholder = "Введите пароль"
        self.passwordField.layer.cornerRadius = 20
        self.passwordField.borderStyle = UITextField.BorderStyle.roundedRect

        self.forgotPassword.setTitleColor(.blue, for: .normal)

        self.entrance.setTitleColor(.white, for: .normal)
        self.entrance.backgroundColor = .gray
        self.entrance.layer.cornerRadius = 10

        self.register.setTitleColor(.red, for: .normal)
    }
    @IBAction func forgotAction(_ sender: Any) {
        guard let _ = onForgotTapHandler else { return }
        self.onForgotTapHandler?()
    }
    
    @IBAction func registerAction(_ sender: Any) {
        guard let _ = onRegisterTapHandler else { return }
        self.onRegisterTapHandler?()
    }
    @IBAction func entranceAction(_ sender: Any) {
        guard let _ = onLoginTapHandler else { return }
        self.onLoginTapHandler?()
    }
    
}