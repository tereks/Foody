//
//  SearchItemCell.swift
//  FoodSearch
//
//  Created by Sergey Kim on 05.02.2020.
//  Copyright © 2020 Sergey Kim. All rights reserved.
//

import UIKit

final class SearchItemCell: UITableViewCell, CellReusable {

    private(set) lazy var view: SearchItemView = {
        let view = SearchItemView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        initialConfigure()
        configureLayout()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialConfigure()
        configureLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialConfigure()
        configureLayout()
    }

    private func initialConfigure() {
        backgroundColor = .clear
        contentView.addSubview(view)
    }

    private func configureLayout() {
        view.edgesToSuperview()
    }

    func configure(item: FoodItem) {
        view.configure(item: item)
    }
}
