//
//  RegisterView.swift
//  decooking
//
//  Created by Иван Морозов on 12.11.2020.
//

import UIKit

protocol IRegisterView : AnyObject {
    var onRegister: ((String, String, String) -> Void)? { get set }
    var onBack: (() -> Void)? { get set }
}

class RegisterView: UIView, IRegisterView {
    var onRegister: ((_ username: String, _ email: String, _ password: String) -> Void)?
    var onBack: (() -> Void)?
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var haveAccount: UIButton!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var register: UIButton!
    
    @IBOutlet weak var error: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.username.placeholder = "Введите username"
        self.username.layer.cornerRadius = 20
        self.username.borderStyle = .roundedRect
        
        self.email.placeholder = "Введите email"
        self.email.layer.cornerRadius = 20
        self.email.borderStyle = .roundedRect
        
        self.password.placeholder = "Придумайте пароль"
        self.password.layer.cornerRadius = 20
        self.password.borderStyle = .roundedRect
        
        self.register.layer.cornerRadius = 10
        self.register.backgroundColor = .gray
        
        self.error.text = " "
        self.error.isHidden = true
    }
    
    @IBAction func backAction(_ sender: Any) {
        guard let onBack = self.onBack else { return }
        onBack()
    }
    @IBAction func registerAction(_ sender: Any) {
        guard let onRegister = self.onRegister else { return }
        guard let username = self.username.text else { return }
        guard let email = self.email.text else { return }
        guard let password = self.password.text else { return }
        guard username.count >= 1 else { return }
        guard email.count >= 1 else { return }
        guard password.count >= 1 else { return }
        onRegister(username, email, password)
    }
    
}
