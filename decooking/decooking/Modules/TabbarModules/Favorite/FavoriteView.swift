//
//  FavoriteView.swift
//  decooking
//
//  Created by Ivan Morozov on 24.12.2020.
//


import UIKit

protocol IFavoriteView : AnyObject {
    func set(recipes: [RecipeData], pictures: [UIImage])
    var onRecipe: ((_ recipe: RecipeData, _ image: UIImage) -> Void)? { get set }
}

class FavoriteView: UIView, IFavoriteView {
    var onRecipe: ((RecipeData, UIImage) -> Void)?
    
    @IBOutlet weak var recipesTable: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    private var recipes: [RecipeData] = [RecipeData]()
    private var recipesImages: [UIImage] = [UIImage]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let reuseId = "\(RecipesTableCell.self)"
        let cellNib = UINib(nibName: reuseId, bundle: nil)
        self.recipesTable.register(cellNib, forCellReuseIdentifier: reuseId)
        
        self.recipesTable.delegate = self
        self.recipesTable.dataSource = self
        
        self.recipesTable.rowHeight = 200
    }
    
    func set(recipes: [RecipeData], pictures: [UIImage]) {
        self.recipes = recipes
        self.recipesImages = pictures
        self.recipesTable.reloadData()
    }
    
    
}

extension FavoriteView: UITableViewDataSource, UITableViewDelegate {
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
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        guard let onRecipe = self.onRecipe else { return }
        onRecipe(recipes[indexPath.row], recipesImages[indexPath.row])
    }
}

