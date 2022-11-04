//
//  AUIProgressView.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 04.11.2022.
//

import Foundation

final class AUIProgressView: AUIView {

    @Convertible(default: 0.0)
    var progress: Double

    @Convertible
    var trackTintColor: AUIColor

    @Convertible
    var progressTintColor: AUIColor
}
