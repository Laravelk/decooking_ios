//
//  SearchView.swift
//  decooking
//
//  Created by Иван Морозов on 17.12.2020.
//

import UIKit

protocol ISearchView: AnyObject {
    
}

class SearchView: UIView, ISearchView {
    @IBOutlet weak var searchTable: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let data: [String] = ["Hello", "World", "Disnay", "Diary", "Supreme", "Member", "Memory", "Critical", "System"]
    var displayData: [String] = [String]()
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }

}


extension SearchView: UITableViewDelegate, UITableViewDataSource {
public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var cell = searchTable.dequeueReusableCell(withIdentifier: "cell")// as? UITableViewCell
    if cell == nil {
        cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
    }

    cell?.textLabel?.text = displayData[indexPath.row]
    return cell!
}

public func numberOfSections(in tableView: UITableView) -> Int {
    return 1
}

public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return displayData.count
}
}

extension SearchView: UISearchBarDelegate {
func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    displayData = data.filter { $0.range(of: searchText, options: .caseInsensitive) != nil }
    searchTable.reloadData()
}
}
