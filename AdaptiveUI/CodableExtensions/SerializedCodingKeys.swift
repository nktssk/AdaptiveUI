//
//  AUIConfiguration.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 04.11.2022.
//

import Foundation

struct SerializedCodingKeys: CodingKey {
    var stringValue: String
    var intValue: Int?
    
    init(key: String) {
        stringValue = key
    }
    
    init?(stringValue: String) {
        self.stringValue = stringValue
    }
    
    init?(intValue: Int) {
        self.intValue = intValue
        self.stringValue = String(intValue)
    }
}
