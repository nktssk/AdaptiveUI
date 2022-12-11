//
//  AUIInsets.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 04.11.2022.
//

import Foundation

public struct AUIInsets: Serializable {
    @Convertible(default: .zero)
    public var top: Double

    @Convertible(default: .zero)
    public var left: Double

    @Convertible(default: .zero)
    public var right: Double

    @Convertible(default: .zero)
    public var bottom: Double

    public init() {}
}

public struct AUISize: Serializable {
    @Convertible(default: .zero)
    public var width: Double

    @Convertible(default: .zero)
    public var height: Double

    public init() {}
}

public struct AUIOffset: Serializable {
    @Convertible(default: .zero)
    public var x: Double

    @Convertible(default: .zero)
    public var y: Double

    public init() {}
}
