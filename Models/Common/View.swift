//
//  View.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 09.10.2022.
//

import Foundation

public class BaseView: ViewRepresentable {
    // Required
    public let identifier: String

    // Additional
    public let views: [View]
    public let shadow: Shadow?
    public let cornerRadius: Double?
    public let accessibilityLabel: String?

    // Default Values
    public var contentInsets: Insets = .zero
    public var backgroundColor: Background = .empty
}
