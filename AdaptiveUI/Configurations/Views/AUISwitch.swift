//
//  AUISwitch.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 05.11.2022.
//

import Foundation

final class AUISwitch: AUIView {

    // MARK: Configuration

    @Convertible(default: false)
    var isOn: Bool

    @Convertible
    var onTintColor: AUIColor?

    @Convertible
    var thumbTintColor: AUIColor?
}
