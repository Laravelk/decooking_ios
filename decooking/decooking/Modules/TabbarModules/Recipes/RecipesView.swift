//
//  RecipesView.swift
//  decooking
//
//  Created by Иван Морозов on 05.11.2020.
//

import UIKit

protocol IRecipesView : AnyObject {
    var onSave: (() -> Void)? { get set }
    var onSearch: ((String) -> Void)? { get set }
    func addDoneButtonOnKeyboard() -> Void
    func set(ingredients: [Ingredient])
}

class RecipesView: UIView, IRecipesView {
    
    var onSave: (() -> Void)?
    var onSearch: ((String) -> Void)?
    
    private var ingredients: [Ingredient] = [Ingredient]()
    
    @IBOutlet weak var ingredientsTable: UITableView!
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let reuseId = "\(IngredientCell.self)"
        let cellNib = UINib(nibName: reuseId, bundle: nil)
        self.ingredientsTable.register(cellNib, forCellReuseIdentifier: reuseId)
        
        self.searchButton.layer.cornerRadius = 10
        self.searchButton.backgroundColor = .systemOrange
        self.searchButton.tintColor = .white
        
        self.saveButton.layer.cornerRadius = 10
        self.saveButton.backgroundColor = .systemOrange
        self.saveButton.tintColor = .white
    }
    
    func addDoneButtonOnKeyboard() {
        let keypadToolBar: UIToolbar = UIToolbar()
        
        keypadToolBar.items = [
            UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: searchField, action: #selector(UITextField.resignFirstResponder)),
            UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        ]
        keypadToolBar.sizeToFit()
        searchField.inputAccessoryView = keypadToolBar
    }
    
    func set(ingredients: [Ingredient]) {
        self.ingredients = ingredients
        print(self.ingredients)
        self.ingredientsTable.reloadData()
    }
    
    @IBAction func saveAction(_ sender: Any) {
        guard let onSave = self.onSave else { return }
        onSave()
    }
    
    @IBAction func searchAction(_ sender: Any) {
        guard let onSearch = onSearch else { return }
        guard let text = searchField.text else { return }
        onSearch(text)
    }
}

extension RecipesView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.ingredientsTable.dequeueReusableCell(withIdentifier: "\(IngredientCell.self)", for: indexPath) as! IngredientCell
        
        let ingredientName = self.ingredients[indexPath.row]
        cell.set(name: ingredientName.name)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
 
extension RecipesView: UITableViewDelegate {

}
