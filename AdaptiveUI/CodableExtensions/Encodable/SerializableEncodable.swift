//
//  AUIConfiguration.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 04.11.2022.
//

import Foundation

public protocol SerializableEncodable: Encodable {
    init()
}

public extension SerializableEncodable {
    static func generate(_ operation: (Self) -> Void) -> Self {
        let value = Self.init()
        operation(value)
        return value
    }
}
