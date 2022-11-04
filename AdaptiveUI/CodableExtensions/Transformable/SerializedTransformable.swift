//
//  AUIConfiguration.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 04.11.2022.
//

import Foundation

@propertyWrapper
final class SerializedTransformable<T: Transformable> {
    let key: String?
    let alternateKey: String?
    var wrappedValue: T.To?
    
    init(_ key: String? = nil, alternateKey: String? = nil) {
        self.key = key
        self.alternateKey = alternateKey
        self.wrappedValue = nil
    }
}

extension SerializedTransformable: EncodableProperty where T.From: Encodable {
    
    func encodeValue(from container: inout EncodeContainer, propertyName: String) throws {
        let codingKey = SerializedCodingKeys(key: key ?? propertyName)
        try container.encode(T.transformToJSON(value: wrappedValue), forKey: codingKey)
    }
}

extension SerializedTransformable: DecodableProperty where T.From: Decodable {
    
    func decodeValue(from container: DecodeContainer, propertyName: String) throws {
        let codingKey = SerializedCodingKeys(key: key ?? propertyName)
        
        if let value = try? container.decodeIfPresent(T.From.self, forKey: codingKey) {
            self.wrappedValue = T.transformFromJSON(value: value)
        } else if let altKey = alternateKey {
            let altCodingKey = SerializedCodingKeys(key: altKey)
            let value = try? container.decodeIfPresent(T.From.self, forKey: altCodingKey)
            self.wrappedValue = T.transformFromJSON(value: value)
        } else {
            self.wrappedValue = T.transformFromJSON(value: nil)
        }
    }
}
