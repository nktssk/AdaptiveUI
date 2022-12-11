//
//  AUIConfiguration.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 04.11.2022.
//

import Foundation

public typealias Transformable = TransformableFromJSON & TransformableToJSON

public protocol TransformableFromJSON {
    associatedtype From: Any
    associatedtype To: Any
    
    static func transformFromJSON(value: From?) -> To?
}

public protocol TransformableToJSON {
    associatedtype From: Any
    associatedtype To: Any
    
    static func transformToJSON(value: To?) -> From?
}
