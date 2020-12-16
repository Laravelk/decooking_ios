//
//  ingredientCell.swift
//  decooking
//
//  Created by Иван Морозов on 16.12.2020.
//

import UIKit

class IngredientCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
     
    func set(name: String) {
        print("setNAME")
        self.label.text = name
    }
}
