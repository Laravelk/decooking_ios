//
//  RecipesResultView.swift
//  decooking
//
//  Created by Ivan Morozov on 20.12.2020.
//

import UIKit

protocol IRecipesResultView : AnyObject {
    func set(recipes: [RecipeData], pictures: [UIImage])
}

class RecipesResultView: UIView, IRecipesResultView {
    
    @IBOutlet weak var recipesTable: UITableView!
    
    private var recipes: [RecipeData] = [RecipeData]()
    private var recipesImages: [UIImage] = [UIImage]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let reuseId = "\(RecipesTableCell.self)"
        let cellNib = UINib(nibName: reuseId, bundle: nil)
        self.recipesTable.register(cellNib, forCellReuseIdentifier: reuseId)
        
        self.recipesTable.delegate = self
        self.recipesTable.dataSource = self
    }
    
    func set(recipes: [RecipeData], pictures: [UIImage]) {
        self.recipes = recipes
        self.recipesImages = pictures
        self.recipesTable.reloadData()
    }
    
    
}

extension RecipesResultView: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.recipesTable.dequeueReusableCell(withIdentifier: "\(RecipesTableCell.self)", for: indexPath) as! RecipesTableCell
        let recipe = self.recipes[indexPath.row]
        let picture = self.recipesImages[indexPath.row]
        cell.set(recipe: recipe, picture: picture)
        return cell
    }
}
