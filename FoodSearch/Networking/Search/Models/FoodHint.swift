//
//  FoodHint.swift
//  FoodSearch
//
//  Created by Sergey Kim on 05.02.2020.
//  Copyright © 2020 Sergey Kim. All rights reserved.
//

import Foundation

struct FoodHint: Decodable {

    let item: FoodItem

    enum CodingKeys: String, CodingKey {
        case food
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        item = try values.decode(FoodItem.self, forKey: .food)
    }
}
