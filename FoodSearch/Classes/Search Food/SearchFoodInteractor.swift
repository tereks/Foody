//
//  SearchFoodInteractor.swift
//  FoodSearch
//
//  Created Sergey Kim on 05.02.2020.
//  Copyright © 2020 Sergey Kim. All rights reserved.
//

import UIKit

final class SearchFoodInteractor {

    struct Dependencies {
        let presenter: SearchFoodPresenter
        let networkFactory: NetworkFactory
    }
    private var dip: Dependencies

    private lazy var api: SearchAPI = {
        return dip.networkFactory.searchAPI()
    }()
    private var searchWorkItem: DispatchWorkItem?

    init(dependencies: Dependencies) {
        self.dip = dependencies
    }

    func viewDidLoad() {
        self.dip.presenter.onViewDidLoad()
    }

    func searchDidSelected(searchText: String?) {
        searchWorkItem?.cancel()
        let workItem = DispatchWorkItem { [unowned self] in
            self.handleSearchQuery(searchText)
        }
        searchWorkItem = workItem
        DispatchQueue.main.asyncAfter(deadline: .now(), execute: workItem)
    }

    private func handleSearchQuery(_ query: String?) {
        guard let query = query else {
            dip.presenter.setItems([])
            dip.presenter.reloadData()
            return
        }
        reloadData(query: query)
    }

    private func reloadData(query: String) {
        let params = SearchParameters(ingredient: query)
        dip.presenter.showHUD()
        api.getFoodItems(params: params) { [unowned self] result in
            self.dip.presenter.hideHUD()
            switch result {
            case .success(let items):
                self.dip.presenter.setItems(items)
                self.dip.presenter.reloadData()
            case .failure(let error):
                self.dip.presenter.showError(error)
            }
        }
    }
}
