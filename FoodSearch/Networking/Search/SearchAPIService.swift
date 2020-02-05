//
//  SearchAPIService.swift
//  FoodSearch
//
//  Created by Sergey Kim on 05.02.2020.
//  Copyright © 2020 Sergey Kim. All rights reserved.
//

import Foundation
import Alamofire

public typealias AFResult = Alamofire.Result

final class SearchAPIService: SearchAPI {

    private let sessionManager: SessionManager
    private var currentRequest: Request?

    private let queue = DispatchQueue(label: "com.edamam.search", qos: .default, attributes: .concurrent)

    init(sessionManager: SessionManager) {
        self.sessionManager = sessionManager
    }

    func getFoodItems(params: SearchParameters,
                      completion: @escaping (AFResult<[FoodItem]>) -> Void) {
        sessionManager.request(SearchRequest.search(params: params))
            .logRequest()
            .validate(statusCode: 200..<300)
            .responseData(queue: queue) { response in
                switch response.result {
                case .success(let data):
                    do {
                        let object = try JSONDecoder().decode(SearchResponse.self, from: data)
                        let items = object.hints.map { $0.item }
                        DispatchQueue.main.async { completion(.success(items)) }
                    } catch {
                        throwError(error, completion)
                    }
                case .failure(let error):
                    throwError(error, completion)
                }
        }
    }
}

func throwError<Value>(_ error: Error, _ completion: ((AFResult<Value>) -> Void)?) {
    DispatchQueue.main.async {
        completion?(.failure(error))
    }
}
