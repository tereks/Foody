//
//  NetworkFactory.swift
//  FoodSearch
//
//  Created by Sergey Kim on 05.02.2020.
//  Copyright © 2020 Sergey Kim. All rights reserved.
//

import Foundation
import Alamofire

final class NetworkFactory {

    private let sessionManager: SessionManager

    init(sessionManager: SessionManager = NetworkFactory.sessionManager) {
        self.sessionManager = sessionManager
    }

    func searchAPI() -> SearchAPI {
        return SearchAPIService(sessionManager: sessionManager)
    }
}

extension NetworkFactory {

    static var sessionManager: SessionManager {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 20

        let sessionManager = Alamofire.SessionManager(configuration: configuration)
        return sessionManager
    }
}
