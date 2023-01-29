//
//  MockAUIViewConfigurationProcessor.swift
//  AdaptiveUI-Example
//
//  Created by n.sosyuk on 07.12.2022.
//

import Foundation
import AdaptiveUI

class MockAUIViewConfigurationProcessor: AUIViewConfigurationProcessorProtocol {

    private let configurationBuilder: ConfigurationBuilderProtocol.Type

    init(configurationBuilder: ConfigurationBuilderProtocol.Type) {
        self.configurationBuilder = configurationBuilder
    }

    func download(completion: @escaping (Result<AUIConfiguration, Error>) -> Void) {
        let configuration = configurationBuilder.configuration
        completion(.success(configuration))
        log()
    }

    private func log() {
        guard let data = try? JSONEncoder().encode(configurationBuilder.configuration),
              let string = String(data: data, encoding: .utf8)
        else { return }

        print("--------------Configuration-Start--------------")
        print(string)
        print("--------------Configuration-End--------------")
    }
}
