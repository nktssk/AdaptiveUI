//
//  AUIInsets.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 04.11.2022.
//

import Foundation

struct AUIInsets: Serializable {
    @Convertible(default: .zero)
    var top: Double

    @Convertible(default: .zero)
    var left: Double

    @Convertible(default: .zero)
    var right: Double

    @Convertible(default: .zero)
    var bottom: Double
}

struct AUISize: Serializable {
    @Convertible(default: .zero)
    var width: Double

    @Convertible(default: .zero)
    var height: Double
}

struct AUIOffset: Serializable {
    @Convertible(default: .zero)
    var x: Double

    @Convertible(default: .zero)
    var y: Double
}
