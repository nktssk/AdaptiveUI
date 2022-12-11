//
//  AUIProgressView.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 04.11.2022.
//

import Foundation

public final class AUIProgressView: AUIView {

    @Convertible(default: .zero)
    public var progress: Float

    @Convertible
    public var trackTintColor: AUIColor

    @Convertible
    public var progressTintColor: AUIColor
}
