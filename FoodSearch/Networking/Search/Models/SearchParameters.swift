//
//  SearchParameters.swift
//  FoodSearch
//
//  Created by Sergey Kim on 05.02.2020.
//  Copyright © 2020 Sergey Kim. All rights reserved.
//

import Foundation

public struct SearchParameters: Encodable {

    let ingredient: String

    enum CodingKeys: String, CodingKey {
        case ingr
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(ingredient, forKey: .ingr)
    }
}
