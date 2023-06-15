//
//  ConfigurationBuilderProtocol.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 11.12.2022.
//

import Foundation

enum ConfigurationBuilderError: Error {
    case buildFailed
}

public protocol ConfigurationBuilderProtocol {
    static var configuration: AUIConfiguration { get }
    static var controller: AUIController { get }
    static var layout: [AUIConstraint] { get }
    static var views: [ViewConfiguration] { get }
    static var cache: Bool { get }
    
    func build() throws -> String
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
    
    public func build() throws -> String {
        guard let data = try? JSONEncoder().encode(Self.configuration),
              let string = String(data: data, encoding: .utf8)
        else { throw ConfigurationBuilderError.buildFailed }

        return string
    }
}
