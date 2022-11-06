//
//  AUIConstraint.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 06.11.2022.
//

import Foundation

struct AUIConstraint: Serializable {

    enum Anchor: String, Codable {
        case width
        case height
        case top
        case bottom
        case leading
        case trailing
        case centerX
        case centerY
    }

    enum RelationType: String, Codable {
        case lessThanOrEqual
        case equal
        case greaterThanOrEqual
    }

    enum Kind: Codable {
        case relation(source: String, sourceAnchor: Anchor,  relationType: RelationType, multiplier: Double? = nil, constant: Double? = nil)
        case constant(value: Double)
    }

    @Convertible
    var kind: Kind

    @Convertible
    var target: String

    @Convertible
    var targetAnchor: Anchor
}
