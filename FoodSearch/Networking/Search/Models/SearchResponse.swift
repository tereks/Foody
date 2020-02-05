//
//  SearchResponse.swift
//  FoodSearch
//
//  Created by Sergey Kim on 05.02.2020.
//  Copyright © 2020 Sergey Kim. All rights reserved.
//

import Foundation

struct SearchResponse: Decodable {

    let hints: [FoodHint]

    enum CodingKeys: String, CodingKey {
        case hints
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        hints = try values.decode([FoodHint].self, forKey: .hints)
    }
}
