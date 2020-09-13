//
//  CategoriesManager.swift
//  Cocktail DB
//
//  Created by MineDest on 9/13/20.
//  Copyright © 2020 MineDest. All rights reserved.
//

import Foundation
class CategoriesManager: CategoriesProviderProtocol {
    

    var networkManager = Network()

    func getCategories(categories: @escaping (Categories) -> Void) {
        networkManager.network(api:"https://www.thecocktaildb.com/api/json/v1/1/list.php?c=list") { (result: Result<CategoryList, Error>) in
                    switch result {
                    case .success(let value):
                        DispatchQueue.main.async {
                            categories(self.setCategories(categoryList: value))
                        }
                    case .failure:
                        print("Failure")
                    }
                }
    }

    func setCategories(categoryList: CategoryList) -> Categories {
        var categories = [String]()
        for category in categoryList.drinks{
            categories.append(category.strCategory)
            print(category.strCategory)
        }
        return Categories(category: categories)
    }
}
