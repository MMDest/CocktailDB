//
//  FiltersTableViewController.swift
//  Cocktail DB
//
//  Created by MineDest on 9/11/20.
//  Copyright © 2020 MineDest. All rights reserved.
//

import UIKit

class FiltersTableViewController: UITableViewController {
    @IBOutlet weak var filtersLabel: UILabel!

    var categoryList: Categories?
    var networkManager: CategoriesProviderProtocol = CategoriesManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
        filtersLabel.text = "Filters"
        self.networkManager.getCategories { (categories) in
            self.categoryList = categories
            self.tableView.reloadData()
            print("error")
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryList?.category.count ?? 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCategories", for: indexPath) as? FiltersTableViewCell
        cell?.filtersLabel.text = categoryList?.category[indexPath.row]
        return cell ?? UITableViewCell()
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? FiltersTableViewCell
        cell?.checkImageView.isHidden = !(cell?.checkImageView.isHidden ?? false)
    }
    
    @IBAction func BackToDrinksViewController(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
