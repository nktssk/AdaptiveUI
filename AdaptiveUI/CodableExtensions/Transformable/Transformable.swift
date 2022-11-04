//
//  AUIConfiguration.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 04.11.2022.
//

import Foundation

typealias Transformable = TransformableFromJSON & TransformableToJSON

protocol TransformableFromJSON {
    associatedtype From: Any
    associatedtype To: Any
    
    static func transformFromJSON(value: From?) -> To?
}

protocol TransformableToJSON {
    associatedtype From: Any
    associatedtype To: Any
    
    static func transformToJSON(value: To?) -> From?
}
