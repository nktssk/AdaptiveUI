//
//  AUIButton.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 05.11.2022.
//

import Foundation

public final class AUIButton: AUIView {

    // MARK: Nested types

    public enum ImageAlignment: String, Codable {
        case right
        case left
    }

    // MARK: Configuration

    @Convertible
    public var text: AUIText?

    @Convertible
    public var image: AUIImage?

    @Convertible(default: .defaultButtonTintColor)
    public var tintColor: AUIColor

    @Convertible(default: nil)
    public var textColor: AUIColor?

    @Convertible
    public var selectedColor: AUIColor?
}
