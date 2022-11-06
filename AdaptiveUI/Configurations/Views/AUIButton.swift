//
//  AUIButton.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 05.11.2022.
//

import Foundation

final class AUIButton: AUIView {

    // MARK: Nested types

    enum ImageAlignment: String, Codable {
        case right
        case left
    }

    // MARK: Configuration

    @Convertible
    var title: AUIText?

    @Convertible
    var backgroundImage: AUIImage?

    @Convertible(default: .defaultButtonTintColor)
    var tintColor: AUIColor

    @Convertible(default: .left)
    var imageAlignment: ImageAlignment
}
