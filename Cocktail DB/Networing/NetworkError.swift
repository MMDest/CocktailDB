//
//  NetworkError.swift
//  Cocktail DB
//
//  Created by MineDest on 9/13/20.
//  Copyright © 2020 MineDest. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case unknown
    case noJSONData
    case failDecode
}
