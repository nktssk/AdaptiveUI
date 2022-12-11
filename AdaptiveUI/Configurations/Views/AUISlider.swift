//
//  AUISlider.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 04.11.2022.
//

import Foundation

public final class AUISlider: AUIView {

    // MARK: Configuration

    @Convertible(default: .zero)
    public var minValue: Float

    @Convertible(default: .zero)
    public var currentValue: Float

    @Convertible
    public var maxValue: Float

    @Convertible
    public var minImage: AUIImage?

    @Convertible
    public var maxImage: AUIImage?
}
