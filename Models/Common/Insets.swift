//
//  Insets.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 09.10.2022.
//

import Foundation

public struct Insets: Decodable {
    public var top: Int
    public var left: Int
    public var right: Int
    public var botton: Int

    public static let zero = Insets(top: .zero, left: .zero, right: .zero, botton: .zero)
}
