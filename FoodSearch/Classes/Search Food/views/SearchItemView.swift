//
//  SearchItemView.swift
//  FoodSearch
//
//  Created by Sergey Kim on 05.02.2020.
//  Copyright © 2020 Sergey Kim. All rights reserved.
//

import UIKit

final class SearchItemView: UIView {

    enum Constants {

        static let insets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)

        static let separatorInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)

        static let spacing: CGFloat = 10
    }

    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        view.numberOfLines = 2
        return view
    }()

    private lazy var categoryLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        view.numberOfLines = 2
        return view
    }()

    private lazy var separator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray
        return view
    }()

    // MARK: - Life cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialConfigure()
        configureLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialConfigure()
        configureLayout()
    }

    // MARK: Actions

    private func initialConfigure() {
        addSubview(titleLabel)
        addSubview(categoryLabel)
        addSubview(separator)
    }

    private func configureLayout() {
        titleLabel.edgesToSuperview(excluding: .bottom, insets: Constants.insets)

        categoryLabel.topToBottom(of: titleLabel, offset: Constants.spacing)
        categoryLabel.edgesToSuperview(excluding: .top, insets: Constants.insets)

        separator.edgesToSuperview(excluding: .top, insets: Constants.separatorInsets)
        separator.height(pixelHeight())
    }

    func configure(item: FoodItem) {
        titleLabel.text    = item.name
        categoryLabel.text = item.category
    }
}
