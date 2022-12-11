//
//  AUIActivityIndicator.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 04.11.2022.
//

import Foundation

public final class AUIActivityIndicator: AUIView {

    @Convertible(default: true)
    public var isLarge: Bool

    @Convertible
    public var color: AUIColor

    @Convertible(default: true)
    public var isAnimating: Bool
}
