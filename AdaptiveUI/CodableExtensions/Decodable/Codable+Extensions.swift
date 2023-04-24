//
//  Codable+Extensions.swift
//  AdaptiveUI
//
//  Created by Nikita Sosyuk on 21.04.2023.
//

import Foundation


public extension SerializableDecodable {
    
    func decode(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: SerializedCodingKeys.self)
        var mirror: Mirror? = Mirror(reflecting: self)
        
        repeat {
            guard let children = mirror?.children else { break }
            
            for child in children {
                guard let decodableKey = child.value as? DecodableProperty else { continue }
                let propertyName = String((child.label ?? "").dropFirst())
                try decodableKey.decodeValue(from: container, propertyName: propertyName)
            }
            mirror = mirror?.superclassMirror
        } while mirror != nil
    }
    
    init(from decoder: Decoder) throws {
        self.init()
        try decode(from: decoder)
    }
}

public extension SerializableEncodable {
    
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

