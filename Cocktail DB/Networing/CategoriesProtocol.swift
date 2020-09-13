//
//  CategoriesProtocol.swift
//  Cocktail DB
//
//  Created by MineDest on 9/13/20.
//  Copyright © 2020 MineDest. All rights reserved.
//

import Foundation

protocol CategoriesProviderProtocol {
    func getCategories(categories: @escaping (Categories) -> Void)
}
struct Categories {
    var category: [String]
}
