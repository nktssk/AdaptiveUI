//
//  AUIText.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 04.11.2022.
//

import Foundation

public struct AUIText: Serializable {

    // MARK: Nested Types

    public enum FontWeight: String, Decodable {
        case light
        case medium
        case regular
        case bold
    }

    // MARK: Configuration

    @Convertible
    public var content: String

    @Convertible(default: 12)
    public var fontSize: Int

    @Convertible(default: .regular)
    public var fontWeight: FontWeight

    public init() {}
}
