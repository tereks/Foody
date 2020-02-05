//
//  SearchFoodPresenter.swift
//  FoodSearch
//
//  Created Sergey Kim on 05.02.2020.
//  Copyright © 2020 Sergey Kim. All rights reserved.
//

import UIKit

final class SearchFoodPresenter {

    fileprivate(set) weak var view: SearchFoodView!

    init(view: SearchFoodView) {
        self.view = view
    }
}

extension SearchFoodPresenter: ErrorDisplay, HUDable {

    func onViewDidLoad() {
        view.initialConfigure()
    }

    func setItems(_ items: [FoodItem]) {
        view.setItems(items)
    }

    func reloadData() {
        view.reloadData()
    }

    func showError(_ error: Error) {
        view.showError(error)
    }

    func showHUD() {
        view.showHUD()
    }

    func hideHUD() {
        view.hideHUD()
    }
}
