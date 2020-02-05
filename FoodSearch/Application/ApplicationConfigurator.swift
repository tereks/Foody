//
//  ApplicationConfigurator.swift
//  FoodSearch
//
//  Created by Sergey Kim on 05.02.2020.
//  Copyright © 2020 Sergey Kim. All rights reserved.
//

import Foundation

final class ApplicationConfigurator {

    class func configure(application: AppDelegate) {

        let dependencyProvider = ApplicationDependenceProvider()
        dependencyProvider.configure()
        application.dependencyProvider = dependencyProvider
    }
}
