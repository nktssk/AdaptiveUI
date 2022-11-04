//
//  AUIConfiguration.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 04.11.2022.
//

import Foundation

protocol SerializableEncodable: Encodable {}

extension SerializableEncodable {
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: SerializedCodingKeys.self)
        var mirror: Mirror? = Mirror(reflecting: self)
        
        repeat {
            guard let children = mirror?.children else { break }
            
            for child in children {
                guard let encodableKey = child.value as? EncodableProperty else { continue }
                let propertyName = String((child.label ?? "").dropFirst())
                
                try encodableKey.encodeValue(from: &container, propertyName: propertyName)
            }
            mirror = mirror?.superclassMirror
        } while mirror != nil
    }
}
