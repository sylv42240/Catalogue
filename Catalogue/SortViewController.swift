//
//  SortViewController.swift
//  Catalogue
//
//  Created by lpiem on 11/03/2020.
//  Copyright © 2020 lpiem. All rights reserved.
//

import UIKit

class SortViewController: UITableViewController {
    var delegate: SortViewControllerDelegate?
    var sortElementsList = [""]
    var sortCase: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        if (sortCase == "sortBy"){
            sortElementsList = ["None", "Name", "Price"]
        }
        if (sortCase == "groupBy"){
            sortElementsList = ["None", "Brand", "Category", "Name"]
        }
    }

    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.sortViewController(self, sortWith: sortElementsList[indexPath.row], sortCase: sortCase!)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortElementsList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        let item = sortElementsList[indexPath.row]
        cell.textLabel?.text = item
        return cell
    }


}

protocol SortViewControllerDelegate {
    func sortViewController(_ controller: SortViewController, sortWith: String, sortCase: String)
}
