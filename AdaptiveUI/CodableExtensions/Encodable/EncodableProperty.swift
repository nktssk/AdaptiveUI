//
//  AUIConfiguration.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 04.11.2022.
//

import Foundation

protocol EncodableProperty {
    typealias EncodeContainer = KeyedEncodingContainer<SerializedCodingKeys>
    
    func encodeValue(from container: inout EncodeContainer, propertyName: String) throws
}
