//
//  ForgotView.swift
//  decooking
//
//  Created by Иван Морозов on 02.12.2020.
//

import UIKit

protocol IForgotView : AnyObject {
    var onBack: (() -> Void)? { get set }
    var onSend: ((String) -> Void)? { get set }
}

class ForgotView: UIView, IForgotView {
    var onBack: (() -> Void)?
    var onSend: ((_ email: String) -> Void)?
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var sendLetterButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.emailField.placeholder = "Введите email"
        self.emailField.layer.cornerRadius = 20
        self.emailField.borderStyle = .roundedRect
        
        self.backButton.setTitleColor(.white, for: .normal)
        self.backButton.backgroundColor = .blue
        self.backButton.layer.cornerRadius = 10
    }
    
    @IBAction func backAction(_ sender: Any) {
        guard let onBack = self.onBack else { return }
        onBack()
    }
    
    @IBAction func sendAction(_ sender: Any) {
        guard let onSend = self.onSend else { return }
        guard let email = emailField.text else { return }
        onSend(email)
    }
    
}
