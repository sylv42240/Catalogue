//
//  DetailViewController.swift
//  Catalogue
//
//  Created by lpiem on 11/03/2020.
//  Copyright © 2020 lpiem. All rights reserved.
//

import UIKit

class FilterViewController: UITableViewController {
    
    private var sortedBy = "None"
    private var groupedBy = "None"
    private var category = "None"
    private var onlyFavorite = false
    private var price = 1000.0
    
    @IBOutlet weak var sortLabel: UILabel!
    @IBOutlet weak var groupLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var favoriteSwitch: UISwitch!
    @IBOutlet weak var priceSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
    }
    
    private func initData(){
        sortLabel.text = sortedBy
        groupLabel.text = groupedBy
        categoryLabel.text = category
        favoriteSwitch.isOn = onlyFavorite
        priceSlider.value = Float(price)
    }
}

extension FilterViewController{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navVC = segue.destination as! SortViewController
        navVC.delegate = self
        navVC.sortCase = segue.identifier
    }
}

extension FilterViewController: SortViewControllerDelegate{
    func sortViewController(_ controller: SortViewController, sortWith: String, sortCase: String) {
        controller.dismiss(animated: true)
        if (sortCase == "sortBy") {
            self.sortedBy = sortWith
            sortLabel.text = sortWith
        }
        if (sortCase == "groupBy") {
            self.groupedBy = sortWith
            groupLabel.text = sortWith
        }
    }
}
