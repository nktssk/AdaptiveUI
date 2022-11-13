//
//  AUIProgressView.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 04.11.2022.
//

import Foundation

final class AUIProgressView: AUIView {

    @Convertible(default: .zero)
    var progress: Float

    @Convertible
    var trackTintColor: AUIColor

    @Convertible
    var progressTintColor: AUIColor
}
