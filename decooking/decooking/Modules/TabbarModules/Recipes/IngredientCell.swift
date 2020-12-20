//
//  ingredientCell.swift
//  decooking
//
//  Created by Иван Морозов on 16.12.2020.
//

import UIKit

protocol CellDelegate {
    func didPressButton(_ tag: UIButton, _ ingredient: Ingredient)
}

class IngredientCell: UITableViewCell {
    var cellDelegate: CellDelegate?
    
    private var ingredient: Ingredient?
    
    @IBOutlet weak var button: UIButton!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
     
    func set(ingredient: Ingredient) {
        self.ingredient = ingredient
        button.setTitle(ingredient.name, for: .normal)
        button.tintColor = .black
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        guard let ingredient = self.ingredient else { return }
        cellDelegate?.didPressButton(sender, ingredient)
    }
}
