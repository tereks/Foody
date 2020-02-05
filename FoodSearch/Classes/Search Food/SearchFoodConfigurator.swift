//
//  SearchFoodConfigurator.swift
//  FoodSearch
//
//  Created Sergey Kim on 05.02.2020.
//  Copyright © 2020 Sergey Kim. All rights reserved.
//

import UIKit

final class SearchFoodConfigurator {

    class func createWithNVC() -> SearchFoodNVC {
        let viewController = create()
        let nvc = SearchFoodNVC(rootViewController: viewController)

        return nvc
    }

    class func create() -> SearchFoodVC {
        let viewController = SearchFoodVC()

        let presenter = SearchFoodPresenter(view: viewController)
        let interactor = createInteractor(presenter: presenter)
        
        viewController.interactor = interactor
        viewController.collectionHandler = SearchFoodCollectionHandler()

        return viewController
    }

    private class func createInteractor(presenter: SearchFoodPresenter) -> SearchFoodInteractor {
        let dependencies = SearchFoodInteractor.Dependencies(presenter: presenter,
                                                             networkFactory: resolve())
        return SearchFoodInteractor(dependencies: dependencies)
    }
}
