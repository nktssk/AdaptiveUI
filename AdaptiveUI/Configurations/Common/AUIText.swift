//
//  AUIText.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 04.11.2022.
//

import Foundation

public struct AUIText: Serializable {

    // MARK: Nested Types

    public enum FontWeight: String, Codable {
        case light
        case medium
        case regular
        case bold
    }

    // MARK: Configuration

    @Convertible(default: "")
    public var content: String

    @Convertible(default: 15)
    public var fontSize: Int

    @Convertible(default: .regular)
    public var fontWeight: FontWeight

    public init() {}
}
