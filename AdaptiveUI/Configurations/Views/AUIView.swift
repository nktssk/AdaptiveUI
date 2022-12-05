//
//  AUIView.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 04.11.2022.
//

import Foundation

class AUIView: Serializable {

    // MARK: AdaptiveUI Configuration

    @Convertible
    var identifier: String

    // MARK: Configuration

    @Convertible
    var accessibilityIdentifier: String?

    // MARK: Representation

    @Convertible(default: 1.0)
    var alpha: Double

    @Convertible(default: .zero)
    var cornerRadius: Double

    @Convertible(default: .defaultViewColor)
    var backgroundColor: AUIColor

    @Convertible(default: false)
    var isHidden: Bool

    @Convertible(default: [])
    var subviews: [ViewConfiguration]

    // MARK: Layout

    @Convertible
    var size: AUISize?

    @Convertible(default: .zero)
    var insets: AUIInsets

    required init() {}
}
