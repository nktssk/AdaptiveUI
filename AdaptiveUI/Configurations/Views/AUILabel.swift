//
//  AUILabel.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 04.11.2022.
//

import Foundation

public class AUILabel: AUIView {

    // MARK: Nested Types

    public enum Alignment: String, Codable {
        case left
        case center
        case right
    }

    // MARK: Configuration
    
    @Convertible(default: AUIText())
    public var text: AUIText

    // MARK: Representation

    @Convertible(default: .defaultTextColor)
    public var textColor: AUIColor

    @Convertible
    public var shadowColor: AUIColor?

    @Convertible
    public var shadowOffset: AUIOffset?

    // MARK: Layout

    @Convertible(default: .left)
    public var alignment: Alignment

    @Convertible(default: 1)
    public var maxNumberOfLines: Int
}
