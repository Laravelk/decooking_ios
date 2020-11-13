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
        
        username.placeholder = "Введите username"
        username.layer.cornerRadius = 20
        
        email.placeholder = "Введите email"
        email.layer.cornerRadius = 20
        
        password.placeholder = "Придумайте пароль"
        password.layer.cornerRadius = 20
        
        register.layer.cornerRadius = 20
        
        error.text = " "
        error.isHidden = true
    }
    
}
