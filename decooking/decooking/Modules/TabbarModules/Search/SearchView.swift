//
//  SearchView.swift
//  decooking
//
//  Created by Иван Морозов on 17.12.2020.
//

import UIKit

protocol ISearchView: AnyObject {
    func set(recipes: [RecipeData], pictures: [UIImage])
    var onSearchBarChanged: String? { get set }
}

class SearchView: UIView, ISearchView {
    var onSearchBarChanged: ((String))?
    
    @IBOutlet weak var searchTable: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    private var recipes: [RecipeData] = [RecipeData]()
    private var recipesImages: [UIImage] = [UIImage]()

    var lastSearch: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let reuseId = "\(RecipesTableCell.self)"
        let cellNib = UINib(nibName: reuseId, bundle: nil)
        self.searchTable.register(cellNib, forCellReuseIdentifier: reuseId)
        self.searchTable.rowHeight = 200

        
        searchTable.dataSource = self
        searchTable.delegate = self
        searchBar.delegate = self
    }
    
    
    func set(recipes: [RecipeData], pictures: [UIImage]) {
        self.recipes = recipes
        self.recipesImages = pictures
        self.searchTable.reloadData()
    }

}


extension SearchView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.searchTable.dequeueReusableCell(withIdentifier: "\(RecipesTableCell.self)", for: indexPath) as! RecipesTableCell
        let recipe = self.recipes[indexPath.row]
        let picture = self.recipesImages[indexPath.row]
        cell.set(recipe: recipe, picture: picture)
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
//        guard let onRecipe = self.onRecipe else { return }
//        onRecipe(recipes[indexPath.row], recipesImages[indexPath.row])
    }
}

extension SearchView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        lastSearch = searchText
    }
}
