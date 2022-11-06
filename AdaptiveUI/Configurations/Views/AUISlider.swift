//
//  AUISlider.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 04.11.2022.
//

import Foundation

final class AUISlider: AUIView {

    // MARK: Configuration

    @Convertible(default: .zero)
    var minValue: Float

    @Convertible(default: .zero)
    var currentValue: Float

    @Convertible
    var maxValue: Float

    @Convertible
    var minImage: AUIImage?

    @Convertible
    var maxImage: AUIImage?
}
