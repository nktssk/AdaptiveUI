//
//  ViewRepresentable.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 09.10.2022.
//

import Foundation

public protocol ViewRepresentable: Decodable {
    // Required
    var identifier: String { get }
    var contentInsets: Insets { get }
    var backgroundColor: Background { get }

    // Additional
    var shadow: Shadow? { get }
    var cornerRadius: Double? { get }
    var accessibilityLabel: String? { get }
}
