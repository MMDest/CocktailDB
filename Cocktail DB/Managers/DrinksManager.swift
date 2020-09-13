//
//  DrinksManager.swift
//  Cocktail DB
//
//  Created by MineDest on 9/13/20.
//  Copyright © 2020 MineDest. All rights reserved.
//

import Foundation
class DrinksManager: DrinksProviderProtocol {

    var networkManager = Network()
    func getDrinks(categories: String, drinks: @escaping (DrinkList) -> Void) {
        networkManager.network(api: """
                                    https://www.thecocktaildb.com/api/json/v1/1/filter.php?\
                                    c=\(categories)
                                    """
        ) { (result: Result<DrinkList, Error>) in
                            switch result {
                            case .success(let value):
                                DispatchQueue.main.async {
                                    drinks(value)
                                }
                            case .failure:
                                print("Failure")
                            }
                        }
    }

}
