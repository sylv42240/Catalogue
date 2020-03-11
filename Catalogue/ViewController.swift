//
//  ViewController.swift
//  Catalogue
//
//  Created by lpiem on 11/03/2020.
//  Copyright © 2020 lpiem. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    var ascending = false
    var dataManager: CoreDataManager{
        get{
            return CoreDataManager.shared
        }
    }
    
//    @IBAction func sortButton(_ sender: Any) {
//        if let items = dataManager.loadItems(ascending: ascending){
//            self.items = items
//            tableView.reloadData()
//            ascending = !ascending
//        }
//    }
    
    
    @IBOutlet var tableView: UITableView!
    var items: [Item]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let items = dataManager.loadItems(){
            self.items = items
            tableView.reloadData()
        }
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = items[indexPath.row]
        dataManager.changeItemState(item: item)
        tableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        let item = items[indexPath.row]
        cell.textLabel?.text = item.name
        cell.accessoryType = item.isFavorite ? .checkmark : .none
        return cell
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let items = dataManager.loadItems(searchQuery: searchText){
            self.items = items
            tableView.reloadData()
        }
        
    }
}

