//
//  AUIConfiguration.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 04.11.2022.
//

import Foundation

public struct AUIConfiguration: Serializable {

    // MARK: AdaptiveUI Configuration

    @Convertible
    public var controller: AUIController

    // MARK: Representation

    @Convertible
    public var views: [ViewConfiguration]

    // MARK: Layout

    @Convertible
    public var layout: [AUIConstraint]

    // MARK: Storage
    
    @Convertible(default: false)
    public var cache: Bool

    public init() {}
}
