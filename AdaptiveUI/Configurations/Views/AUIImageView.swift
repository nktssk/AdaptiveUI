//
//  AUIImageView.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 04.11.2022.
//

import Foundation

final class AUIImageView: AUIView {

    // MARK: Nested Types

    enum ContentMode: String, Codable {
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
    var imageName: String?

    @Convertible
    var imageURL: String?

    @Convertible(default: .defaultImageBackgroundColor)
    var tintColor: AUIColor

    // MARK: Layout

    @Convertible
    var contentMode: ContentMode

    @Convertible(default: .zero)
    var imageContentInsets: AUIInsets
}
