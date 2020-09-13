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
    var currentCategoryList : Categories?
    var networkManager: CategoriesProviderProtocol = CategoriesManager()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorStyle = .none
        filtersLabel.text = "Filters"
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryList?.category.count ?? 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCategories", for: indexPath) as? FiltersTableViewCell
        let category = categoryList?.category[indexPath.row] ?? ""
        if currentCategoryList?.category.contains(category) ?? true{
            cell?.checkImageView.isHidden = false
        } else {
            cell?.checkImageView.isHidden = true
        }
        cell?.filtersLabel.text = categoryList?.category[indexPath.row]
        return cell ?? UITableViewCell()
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (currentCategoryList?.category.count ?? 1) - 1 == 0 {
            if currentCategoryList?.category.first == categoryList?.category[indexPath.row]{
                return
            }
        }
            let cell = tableView.cellForRow(at: indexPath) as? FiltersTableViewCell
            if cell?.checkImageView.isHidden ?? false {
                let category = categoryList?.category[indexPath.row] ?? ""
                currentCategoryList?.category.append(category)
            } else {
                let category = categoryList?.category[indexPath.row] ?? ""
                if let index = currentCategoryList?.category.firstIndex(of: category) {
                    currentCategoryList?.category.remove(at: index)
                }
            }
            cell?.checkImageView.isHidden = !(cell?.checkImageView.isHidden ?? false)
        
    }
    
    @IBAction func BackToDrinksViewController(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
}
