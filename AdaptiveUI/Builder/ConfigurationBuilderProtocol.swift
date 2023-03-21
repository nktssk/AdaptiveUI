//
//  ConfigurationBuilderProtocol.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 11.12.2022.
//

import Foundation

public protocol ConfigurationBuilderProtocol {
    static var configuration: AUIConfiguration { get }
    static var controller: AUIController { get }
    static var layout: [AUIConstraint] { get }
    static var views: [ViewConfiguration] { get }
    static var cache: Bool { get }
}

extension ConfigurationBuilderProtocol {
    public static var configuration: AUIConfiguration {
        .generate { configuration in
            configuration.views = self.views
            configuration.layout = self.layout
            configuration.controller = self.controller
            configuration.cache = self.cache
        }
    }

    public static var controller: AUIController {
        .generate { configuration in
            configuration.kind = .static
        }
    }
}
