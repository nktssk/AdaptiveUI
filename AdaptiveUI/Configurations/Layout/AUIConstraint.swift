//
//  AUIConstraint.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 06.11.2022.
//

import Foundation

struct AUIConstraint: Serializable {

    // MARK: Nested Types

    struct RelationConfiguration: Serializable {
        @Convertible(default: "AUIParentView")
        var source: String

        @Convertible
        var sourceAnchor: Anchor

        @Convertible(default: .equal)
        var relationType: RelationType

        @Convertible(default: .zero)
        var constant: Double

        @Convertible(default: .zero)
        var multiplier: Double

        @Convertible(default: 1000)
        var priority: Float
    }

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
        case relation(configuration: RelationConfiguration)
        case constant(value: Double)
    }

    // MARK: AdaptiveUI Configuration

    @Convertible
    var kind: Kind

    @Convertible
    var target: String

    @Convertible
    var targetAnchor: Anchor
}
