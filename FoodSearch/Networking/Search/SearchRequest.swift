//
//  SearchRequest.swift
//  FoodSearch
//
//  Created by Sergey Kim on 05.02.2020.
//  Copyright © 2020 Sergey Kim. All rights reserved.
//

import Foundation
import Alamofire

private let baseURLString = "https://api.edamam.com/api/food-database"
private let appID = "bb527e30"
private let appKey = "96494cc6ce08cd972f1b7b4690af5f74"

enum SearchRequest: URLRequestConvertible {

    case search(params: SearchParameters)

    var method: HTTPMethod {
        return .get
    }

    var path: String {
        switch self {
        case .search:
            return "/parser"
        }
    }

    // MARK: URLRequestConvertible

    func asURLRequest() throws -> URLRequest {
        let url = try baseURLString.asURL()

        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue

        switch self {
        case .search(let parameters):
            let jsonData = try JSONEncoder().encode(parameters)
            var params = try JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as? [String: Any]
            appendAuthDate(toParams: &params)
            urlRequest = try URLEncoding.default.encode(urlRequest, with: params)
        }

        return urlRequest
    }

    private func appendAuthDate(toParams params: inout [String: Any]?) {
        params?["app_id"]  = appID
        params?["app_key"] = appKey
    }
}
