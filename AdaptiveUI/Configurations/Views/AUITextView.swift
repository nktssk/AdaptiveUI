//
//  AUITextView.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 04.11.2022.
//

import Foundation

final class AUITextView: AUIView {

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
    var color: AUIColor

    @Convertible(default: false)
    var isEditable: Bool

    @Convertible(default: true)
    var isSelectable: Bool

    // MARK: Layout

    @Convertible(default: .left)
    var alignment: Alignment

    @Convertible(default: 1)
    var maxNumberOfLines: Int
}
