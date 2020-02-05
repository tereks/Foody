//
//  DataRequest+Logging.swift
//  FoodSearch
//
//  Created by Sergey Kim on 05.02.2020.
//  Copyright © 2020 Sergey Kim. All rights reserved.
//

import Foundation
import Alamofire

extension DataRequest {

    public func logSelf() -> Self {
        #if DEBUG
        return logRequest().logResponse()
        #else
        return self
        #endif
    }

    // MARK: - Request logging

    public func logRequest() -> Self {
        guard let method = request?.httpMethod, let path = request?.url?.absoluteString else {
            return self
        }
        var text = "\n\(method) \(path) \nHeaders: "
        if let headers = request?.allHTTPHeaderFields as NSDictionary? {
            text.append(headers.description)
        }
        if let data = request?.httpBody, let body = String(data: data, encoding: .utf8) {
            text.append("\nData: \"\(body)\"")
        }
        print(text.removingPercentEncoding ?? text)
        return self
    }

    // MARK: - Response logging

    public func logResponse() -> Self {
        return response { response in
            guard let code = response.response?.statusCode,
                let path = response.request?.url?.absoluteString else {
                    return
            }
            var text = "\n\(code) \(path)"
            if let data = response.data, let body = String(data: data, encoding: .utf8) {
                text.append("\nData: \"\(body)\"")
            }
            print(text.removingPercentEncoding ?? text)
        }
    }
}
