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
    var onAddPickedIngredient: ((Ingredient) -> Void)? { get set }
    
    func removeIngredient(names: [String])
    func addDoneButtonOnKeyboard() -> Void
    func set(ingredients: [Ingredient])

    var pickedIngredients: [Ingredient] { get set }
}

class RecipesView: UIView, IRecipesView, CellDelegate {
        
    var onSave: (() -> Void)?
    var onSearch: ((String) -> Void)?
    var onAddPickedIngredient: ((Ingredient) -> Void)?
    
    private var ingredients: [Ingredient] = [Ingredient]()
    var pickedIngredients: [Ingredient] = [Ingredient]()
    
    @IBOutlet weak var ingredientsTable: UITableView!
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let reuseId = "\(IngredientCell.self)"
        let cellNib = UINib(nibName: reuseId, bundle: nil)
        self.ingredientsTable.register(cellNib, forCellReuseIdentifier: reuseId)
        
        self.ingredientsTable.delegate = self
        self.ingredientsTable.dataSource = self
        
        self.searchButton.layer.cornerRadius = 10
        self.searchButton.backgroundColor = .systemOrange
        self.searchButton.tintColor = .white
        
        self.saveButton.layer.cornerRadius = 10
        self.saveButton.backgroundColor = .systemOrange
        self.saveButton.tintColor = .white
        
        self.ingredientsTable.reloadData()
        self.ingredientsTable.isHidden = true
    }
    
    func removeIngredient(names: [String]) {
        var newIngredients: [Ingredient] = [Ingredient]()
        for ingredient in pickedIngredients {
            var removed: Bool = false
            for name in names {
                if name == ingredient.name {
                    removed = true
                }
            }
            if !removed {
                newIngredients.append(ingredient)
            }
        }
        pickedIngredients = newIngredients
    }
    
    func didPressButton(_ tag: UIButton, _ ingredient: Ingredient) {
        pickedIngredients.append(ingredient)
        guard let add = self.onAddPickedIngredient else { return }
        add(ingredient)
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
        self.ingredientsTable.reloadData()
        self.ingredientsTable.isHidden = false
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

extension RecipesView: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ingredients.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.ingredientsTable.dequeueReusableCell(withIdentifier: "\(IngredientCell.self)", for: indexPath) as! IngredientCell
        cell.cellDelegate = self
        let ingredient = self.ingredients[indexPath.row]
        cell.set(ingredient: ingredient)

        return cell
    }
}
