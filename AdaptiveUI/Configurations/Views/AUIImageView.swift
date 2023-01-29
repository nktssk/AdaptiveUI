//
//  AUIImageView.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 04.11.2022.
//

import Foundation

public final class AUIImageView: AUIView {

    // MARK: Nested Types

    public enum ContentMode: String, Codable {
        case scaleToFill
        case scaleAspectFit
        case scaleAspectFill
        case center
        case top
        case bottom
        case left
        case right
        case topLeft
        case topRight
        case bottomLeft
        case bottomRight
    }

    // MARK: Representation

    @Convertible
    public var image: AUIImage?

    @Convertible(default: .defaultImageBackgroundColor)
    public var tintColor: AUIColor

    // MARK: Layout

    @Convertible(default: .scaleAspectFill)
    public var contentMode: ContentMode
}
