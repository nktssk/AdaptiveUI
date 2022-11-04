//
//  AUILabel.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 04.11.2022.
//

import Foundation

class AUILabel: AUIView {

    // MARK: Nested Types

    enum Alignment: String, Codable {
        case left
        case center
        case right
    }

    // MARK: Configuration
    
    @Convertible
    var text: AUIText

    @Convertible(default: .left)
    var alignment: Alignment

    // MARK: Representation

    @Convertible(default: .defaultTextColor)
    var color: AUIColor

    @Convertible
    var shadowColor: String?

    @Convertible(default: .standard)
    var shadowOffset: AUIOffset

    @Convertible(default: 1)
    var maxNumberOfLines: Int
}
