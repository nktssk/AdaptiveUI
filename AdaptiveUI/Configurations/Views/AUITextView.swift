//
//  AUITextView.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 04.11.2022.
//

import Foundation

public final class AUITextView: AUIView {

    // MARK: Nested Types

    public enum Alignment: String, Codable {
        case left
        case center
        case right
    }

    // MARK: Configuration

    @Convertible
    public var text: AUIText

    // MARK: Representation

    @Convertible(default: .defaultTextColor)
    public var color: AUIColor

    @Convertible(default: false)
    public var isEditable: Bool

    @Convertible(default: true)
    public var isSelectable: Bool

    // MARK: Layout

    @Convertible(default: .left)
    public var alignment: Alignment

    @Convertible(default: 1)
    public var maxNumberOfLines: Int
}
