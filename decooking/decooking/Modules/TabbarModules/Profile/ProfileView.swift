//
//  ProfileView.swift
//  decooking
//
//  Created by Иван Морозов on 17.12.2020.
//

import UIKit

protocol IProfileView: AnyObject {
    var onChangePassword: ((String, String) -> Void)? { get set }
    var onChangeProfile: (() -> Void)? { get set }
}

class ProfileView: UIView, IProfileView {
    var onChangePassword: ((_ new: String, _ old: String) -> Void)?
    var onChangeProfile: (() -> Void)?
    
    @IBOutlet weak var oldPasswordField: UITextField!
    @IBOutlet weak var newPasswordField: UITextField!
    @IBOutlet weak var conformNewPasswordField: UITextField!
    @IBOutlet weak var changePasswordButton: UIButton!
    @IBOutlet weak var changeProfileButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.oldPasswordField.placeholder = "Введите старый пароль"
        self.newPasswordField.placeholder = "Введите новый пароль"
        self.conformNewPasswordField.placeholder = "Подтвердите новый пароль"
        
        self.changePasswordButton.layer.cornerRadius = 10
        self.changePasswordButton.backgroundColor = .systemOrange
        self.changePasswordButton.tintColor = .white
        
        self.changeProfileButton.layer.cornerRadius = 10
        self.changeProfileButton.backgroundColor = .systemOrange
        self.changeProfileButton.tintColor = .white
    }
    
    @IBAction func changePassword(_ sender: Any) {
        guard let onPassword = self.onChangePassword else { return }
        guard let old = self.oldPasswordField.text else { return }
        guard let new = self.newPasswordField.text else { return }
        onPassword(old, new)
    }
    
    @IBAction func changeProfile(_ sender: Any) {
        guard let onProfile = self.onChangeProfile else { return }
        onProfile()
    }
    
}
