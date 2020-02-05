//
//  SearchAPI.swift
//  FoodSearch
//
//  Created by Sergey Kim on 05.02.2020.
//  Copyright © 2020 Sergey Kim. All rights reserved.
//

import Foundation

public protocol SearchAPI {

    func getFoodItems(params: SearchParameters, completion: @escaping (AFResult<[FoodItem]>) -> Void)
}
