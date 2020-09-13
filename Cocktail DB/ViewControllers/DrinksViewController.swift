//
//  ViewController.swift
//  Cocktail DB
//
//  Created by MineDest on 9/11/20.
//  Copyright © 2020 MineDest. All rights reserved.
//

import UIKit
import Kingfisher

class DrinksViewController: UIViewController {

    @IBOutlet weak var drinksLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var categoryList: Categories?
    var currentCategoryList : Categories?
    var drinkList = [DrinkList]()
    var categoriesNetworkManager: CategoriesProviderProtocol = CategoriesManager()
    var drinksNetworkManager: DrinksProviderProtocol = DrinksManager()

    @IBAction func didUnwindFromFiltersTableViewController(_ sender: UIStoryboardSegue) {
        guard let filtersVC = sender.source as? FiltersTableViewController else {return}
        currentCategoryList = filtersVC.currentCategoryList
        drinkList = [DrinkList]()
        getDrinks()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        drinksLabel.text = "Drinks"
        self.tableView.separatorStyle = .none
        getCategories()
    }

    fileprivate func getCategories() {
        self.categoriesNetworkManager.getCategories { (categories) in
            self.categoryList = categories
            self.currentCategoryList = categories
            self.getDrinks()
        }
    }

    fileprivate func getDrinks() {
        for category in currentCategoryList?.category ?? [""]{
            let replaceCategory = category.replacingOccurrences(of: " ", with: "_")
            self.drinksNetworkManager.getDrinks(categories: replaceCategory) { (drinks) in
                self.drinkList.append(drinks)
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "filtersSeque"  {
            if let dvc = segue.destination as? FiltersTableViewController {
                    dvc.categoryList = self.categoryList //Or pass any values
                    dvc.currentCategoryList = self.currentCategoryList
            }
        }
    }
}
extension DrinksViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return drinkList.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinkList[section].drinks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "drinksCell", for: indexPath) as? DrinksTableViewCell
        let drinks = drinkList[indexPath.section]
        let drink = drinks.drinks[indexPath.row]
        guard let imageURL = URL(string: drink.strDrinkThumb) else {return UITableViewCell()}
        cell?.drinksImageView.kf.indicatorType = .activity
        cell?.drinksImageView.kf.setImage(with: imageURL)
        cell?.drinksNameLabel.text = drink.strDrink
        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 20))
        headerView.backgroundColor = self.view.backgroundColor
        let label = UILabel()
        label.frame = CGRect.init(x: 15, y: 5, width: headerView.frame.width-10, height: 20)
        guard let section = currentCategoryList?.category[section] else { return UIView()}
        label.text = section
        label.font = UIFont(name: "Roboto-Medium", size: 14)
        label.textColor = UIColor(rgb: 0x7E7E7E)
        headerView.addSubview(label)
        return headerView
    }
}

