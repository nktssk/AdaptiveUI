//
//  Shadow.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 09.10.2022.
//

import Foundation

public struct Shadow: Decodable {
    public struct Offset: Decodable {
       public let x: Double
       public let y: Double
    }

    public let blur: Double
    public let alpha: Double
    public let color: String
    public let offset: Offset
}
