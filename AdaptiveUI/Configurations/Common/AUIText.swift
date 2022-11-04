//
//  AUIText.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 04.11.2022.
//

import Foundation

struct AUIText: Serializable {

    // MARK: Nested Types

    enum FontWeight: String, Decodable {
        case light
        case medium
        case regular
        case bold
    }

    // MARK: Configuration

    @Convertible
    var content: String

    @Convertible(default: 12)
    var fontSize: Int

    @Convertible(default: .regular)
    var fontWeight: FontWeight
}
