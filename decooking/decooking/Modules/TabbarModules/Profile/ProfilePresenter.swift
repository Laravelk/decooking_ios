//
//  ProfilePresenter.swift
//  decooking
//
//  Created by Иван Морозов on 17.12.2020.
//

import UIKit

protocol IProfilePresenter {
    func didLoad(ui: IProfileView)
}



class ProfilePresenter: BasePresenter<IProfileInteractor, IProfileRouter>, IProfilePresenter {
    private weak var ui: IProfileView?
    
    func didLoad(ui: IProfileView) {
        self.ui = ui
        
        ui.onChangePassword = { [weak self] (old, new) in
            
        }
        
        ui.onChangeProfile = { [weak self] () in
            
        }
    }
    
    private func changePassword(old: String, new: String) {
        // token
        // new password
    }
}
