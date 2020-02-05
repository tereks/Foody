//
//  FoodItem.swift
//  FoodSearch
//
//  Created by Sergey Kim on 05.02.2020.
//  Copyright © 2020 Sergey Kim. All rights reserved.
//

import Foundation

public struct FoodItem: Decodable {

    let id: ID
    let name: String
    let category: String

    enum CodingKeys: String, CodingKey {
        case foodId
        case label
        case category
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        id       = try values.decode(ID.self, forKey: .foodId)
        name     = try values.decode(String.self, forKey: .label)
        category = try values.decode(String.self, forKey: .category)
    }
}
