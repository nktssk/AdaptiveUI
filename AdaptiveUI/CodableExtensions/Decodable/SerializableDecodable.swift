//
//  AUIConfiguration.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 04.11.2022.
//

import Foundation

public protocol SerializableDecodable: Decodable {
    init()
    func decode(from decoder: Decoder) throws
}
