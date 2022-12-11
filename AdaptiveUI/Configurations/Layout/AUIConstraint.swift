//
//  AUIConstraint.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 06.11.2022.
//

import Foundation

public struct AUIConstraint: Serializable {

    // MARK: Nested Types

    public struct RelationConfiguration: Serializable {
        @Convertible(default: "AUIParentView")
        public var source: String

        @Convertible
        public var sourceAnchor: Anchor

        @Convertible(default: .equal)
        public var relationType: RelationType

        @Convertible(default: .zero)
        public var constant: Double

        @Convertible(default: .zero)
        public var multiplier: Double

        @Convertible(default: 1000)
        public var priority: Float

        public init() {}
    }

    public enum Anchor: String, Codable {
        case width
        case height
        case top
        case bottom
        case leading
        case trailing
        case centerX
        case centerY
    }

    public enum RelationType: String, Codable {
        case lessThanOrEqual
        case equal
        case greaterThanOrEqual
    }

    public enum Kind: Codable {
        case relation(configuration: RelationConfiguration)
        case constant(value: Double)
    }

    // MARK: AdaptiveUI Configuration

    @Convertible
    public var kind: Kind

    @Convertible
    public var target: String

    @Convertible
    public var targetAnchor: Anchor

    public init() {}
}
