//
//  SearchFoodCollectionHandler.swift
//  FoodSearch
//
//  Created by Sergey Kim on 05.02.2020.
//  Copyright © 2020 Sergey Kim. All rights reserved.
//

import UIKit

final class SearchFoodCollectionHandler: NSObject {

    private weak var tableView: UITableView?
    private var items: [FoodItem] = []

    typealias CellType = SearchItemCell

    func configure(tableView: UITableView) {
        self.tableView = tableView

        tableView.register(CellType.self)
        tableView.dataSource = self
        tableView.delegate   = self
    }

    func setItems(items: [FoodItem]) {
        self.items = items
    }

    func reloadData() {
        tableView?.reloadData()
    }
}

extension SearchFoodCollectionHandler: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CellType = tableView.dequeueReusableCell(for: indexPath)

        let item = items[indexPath.row]
        cell.configure(item: item)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
