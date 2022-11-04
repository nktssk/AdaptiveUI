//
//  AUIActivityIndicator.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 04.11.2022.
//

import Foundation

final class AUIActivityIndicator: AUIView {

    @Convertible(default: true)
    var isLarge: Bool

    @Convertible
    var color: AUIColor

    @Convertible(default: true)
    var isAnimating: Bool
}
