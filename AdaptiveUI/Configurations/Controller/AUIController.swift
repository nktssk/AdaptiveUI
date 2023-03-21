//
//  AUIController.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 04.11.2022.
//

import Foundation

public struct AUIController: Serializable {

    // MARK: Nested Types

    public enum Kind: String, Codable {
        case `static`
        case scrollable
        case webView
    }

    // MARK: AdaptiveUI Configuration

    @Convertible(default: .static)
    public var kind: Kind

    @Convertible
    public var webViewURL: String?

    // MARK: Configuration

    @Convertible
    public var title: String?

    // MARK: Representation

    @Convertible(default: false)
    public var largeTitle: Bool

    @Convertible(default: .defaultViewColor)
    public var backgroundColor: AUIColor

    @Convertible(default: true)
    public var isTranslucent: Bool

    // MARK: Layout

    @Convertible(default: false)
    public var pinToSafeArea: Bool

    public init() {}
}
