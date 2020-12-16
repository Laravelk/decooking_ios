//
//  RecipesScrollView.swift
//  decooking
//
//  Created by Иван Морозов on 16.12.2020.
//

import UIKit

protocol IRecipesScrollView: AnyObject {
    
}

class RecipesScrollView: UIView, IRecipesScrollView {
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.label.text = "TEA"
    }
}
