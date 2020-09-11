//
//  CocktailCategory.swift
//  Cocktail DB
//
//  Created by MineDest on 9/11/20.
//  Copyright © 2020 MineDest. All rights reserved.
//

import Foundation

// MARK: - DrinkList
struct CategoryList: Codable {
    let drinks: [Category]
}

// MARK: - Drink
struct Category: Codable {
    let strCategory: String
}

