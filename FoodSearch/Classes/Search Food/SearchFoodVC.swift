//
//  SearchFoodVC.swift
//  FoodSearch
//
//  Created Sergey Kim on 05.02.2020.
//  Copyright © 2020 Sergey Kim. All rights reserved.
//

import UIKit

final class SearchFoodVC: UIViewController, SearchFoodView {

    // MARK: - Properties

    var interactor: SearchFoodInteractor!
    var collectionHandler: SearchFoodCollectionHandler!

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.delaysContentTouches = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.allowsSelection = true
        tableView.keyboardDismissMode = .onDrag
        return tableView
    }()

    private lazy var searchBar: UISearchBar = {
        let view = UISearchBar(frame: .zero)
        view.placeholder = "Type ingredient"
        view.delegate = self
        return view
    }()

	override func viewDidLoad() {
        super.viewDidLoad()
        interactor.viewDidLoad()
    }

    func initialConfigure() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        navigationItem.titleView = searchBar

        collectionHandler.configure(tableView: tableView)

        configureLayout()
    }

    private func configureLayout() {
        tableView.edgesToSuperview(usingSafeArea: true)
    }

    func setItems(_ items: [FoodItem]) {
        collectionHandler.setItems(items: items)
    }

    func reloadData() {
        collectionHandler.reloadData()
    }
}

extension SearchFoodVC: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        interactor.searchDidSelected(searchText: searchBar.text)
    }
}
