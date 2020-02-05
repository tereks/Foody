//
//  ApplicationDependenceProvider.swift
//  FoodSearch
//
//  Created by Sergey Kim on 05.02.2020.
//  Copyright © 2020 Sergey Kim. All rights reserved.
//

import Foundation
import Dip
import TinyConstraints

let container = DependencyContainer(configBlock: configureContainer)

func configureContainer(container rootContainer: DependencyContainer) {
}

func resolve<T>() -> T {
    return try! container.resolve() as T
}

final class ApplicationDependenceProvider {

    func configure() {
        configureNetworking()
    }

    private func configureNetworking() {
        container.register(.shared) { NetworkFactory() }
    }
}
