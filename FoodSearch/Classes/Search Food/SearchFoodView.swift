//
//  SearchFoodView.swift
//  FoodSearch
//
//  Created Sergey Kim on 05.02.2020.
//  Copyright © 2020 Sergey Kim. All rights reserved.
//

import UIKit

protocol SearchFoodView: class, ErrorDisplay, HUDController {

    var interactor: SearchFoodInteractor! { get set }

    func initialConfigure()

    func setItems(_ items: [FoodItem])

    func reloadData()
}
