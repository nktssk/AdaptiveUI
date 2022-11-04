//
//  AUIConfiguration.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 04.11.2022.
//

import Foundation

protocol SerializableDecodable: Decodable {
    init()
    func decode(from decoder: Decoder) throws
}

extension SerializableDecodable {
    
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
