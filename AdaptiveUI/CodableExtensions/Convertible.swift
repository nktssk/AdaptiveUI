//
//  Convertible.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 04.11.2022.
//

import Foundation

typealias Serializable = SerializableEncodable & SerializableDecodable

@propertyWrapper
public final class Convertible<T> {
    var key: String?
    var alternateKey: String?
    
    private var _value: T?
    
    private func _wrappedValue<U>(_ type: U.Type) -> U? where U: ExpressibleByNilLiteral {
        return _value as? U
    }
    
    private func _wrappedValue<U>(_ type: U.Type) -> U {
        return _value as! U
    }
    
    public var wrappedValue: T {
        get {
            return _wrappedValue(T.self)
        } set {
            _value = newValue
        }
    }
    
    public init(_ key: String? = nil, alternateKey: String? = nil, default value: T? = nil) {
        self.key = key
        self.alternateKey = alternateKey
        self._value = value
    }
}

extension Convertible: EncodableProperty where T: Encodable {
    
    public func encodeValue(from container: inout EncodeContainer, propertyName: String) throws {
        let codingKey = SerializedCodingKeys(key: key ?? propertyName)
        try container.encodeIfPresent(wrappedValue, forKey: codingKey)
    }
}

extension Convertible: DecodableProperty where T: Decodable {
    
    public func decodeValue(from container: DecodeContainer, propertyName: String) throws {
        let codingKey = SerializedCodingKeys(key: key ?? propertyName)
        
        if let value = try? container.decodeIfPresent(T.self, forKey: codingKey) {
            wrappedValue = value
        } else {
            guard let altKey = alternateKey else { return }
            let altCodingKey = SerializedCodingKeys(key: altKey)
            if let value = try? container.decodeIfPresent(T.self, forKey: altCodingKey) {
                wrappedValue = value
            }
        }
    }
}
