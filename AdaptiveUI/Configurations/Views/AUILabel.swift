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

    // MARK: Representation

    @Convertible(default: .defaultTextColor)
    var textColor: AUIColor

    @Convertible
    var shadowColor: AUIColor?

    @Convertible
    var shadowOffset: AUIOffset?

    // MARK: Layout

    @Convertible(default: .left)
    var alignment: Alignment

    @Convertible(default: 1)
    var maxNumberOfLines: Int
}
