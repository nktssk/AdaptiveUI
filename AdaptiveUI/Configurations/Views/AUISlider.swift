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
    var minValue: Double

    @Convertible(default: .zero)
    var currentValue: Double

    @Convertible
    var maxValue: Double

    @Convertible
    var minImage: AUIImage?

    @Convertible
    var maxImage: AUIImage?
}
