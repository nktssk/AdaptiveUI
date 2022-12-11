//
//  AUIView.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 04.11.2022.
//

import Foundation

public class AUIView: Serializable {

    // MARK: AdaptiveUI Configuration

    @Convertible
    public var identifier: String

    // MARK: Configuration

    @Convertible
    public var accessibilityIdentifier: String?

    // MARK: Representation

    @Convertible(default: 1.0)
    public var alpha: Double

    @Convertible(default: .zero)
    public var cornerRadius: Double

    @Convertible(default: .defaultViewColor)
    public var backgroundColor: AUIColor

    @Convertible(default: false)
    public var isHidden: Bool

    @Convertible(default: [])
    public var subviews: [ViewConfiguration]

    // MARK: Layout

    @Convertible
    public var size: AUISize?

    @Convertible(default: .zero)
    public var insets: AUIInsets

    public required init() {}

    // MARK: Action

    @Convertible
    public var actionHandler: AUIAction?
}
