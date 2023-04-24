//
//  AUISwitch.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 05.11.2022.
//

import Foundation

public final class AUISwitch: AUIView {

    // MARK: Configuration

    @Convertible(default: false)
    public var isOn: Bool

    @Convertible
    public var onTintColor: AUIColor?

    @Convertible
    public var thumbTintColor: AUIColor?
}
+ isOn: Bool
+ onTintColor: AUIColor?
+ thumbTintColor: AUIColor?
