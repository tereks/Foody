//
//  ID.swift
//  FoodSearch
//
//  Created by Sergey Kim on 05.02.2020.
//  Copyright © 2020 Sergey Kim. All rights reserved.
//

import Foundation

public struct ID: ExpressibleByStringLiteral, ExpressibleByIntegerLiteral, Hashable {

    public let value: String

    public init(stringLiteral value: String) {
        self.value = value
    }

    public init?(string: String?) {
        guard let _value = string else {
            return nil
        }
        self.init(stringLiteral: _value)
    }


    public init(integerLiteral value: Int) {
        self.value = String(value)
    }

    public init?(int: Int?) {
        guard let _value = int else {
            return nil
        }
        self.init(integerLiteral: _value)
    }

    public func toInt() -> Int? {
        return Int(value)
    }


    public func hash(into hasher: inout Hasher) {
        hasher.combine(value)
    }

    public static func new() -> ID {
        return ID(stringLiteral: UUID().uuidString)
    }
}

extension ID: Codable {

    public init(from decoder: Decoder) throws {
        let values = try decoder.singleValueContainer()

        if let intValue = try? values.decode(Int.self) {
            value = String(describing: intValue)
        }
        else {
            value = try values.decode(String.self)
        }
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.singleValueContainer()
        try values.encode(value)
    }
}
