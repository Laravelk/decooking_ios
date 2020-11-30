//
//  RegisterView.swift
//  decooking
//
//  Created by Иван Морозов on 12.11.2020.
//

import UIKit

protocol IRegisterView : AnyObject {}

class RegisterView: UIView, IRegisterView {
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
    
}
