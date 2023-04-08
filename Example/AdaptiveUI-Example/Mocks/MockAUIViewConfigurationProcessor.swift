//
//  MockAUIViewConfigurationProcessor.swift
//  AdaptiveUI-Example
//
//  Created by n.sosyuk on 07.12.2022.
//

import Foundation
import AdaptiveUI

class MockAUIViewConfigurationProcessor: AUIViewConfigurationProcessorProtocol {
    
    struct MockError: Error {}
    
    var screenId: String
    private let configurationBuilder: ConfigurationBuilderProtocol.Type

    init(
        screenId: String,
        configurationBuilder: ConfigurationBuilderProtocol.Type
    ) {
        self.screenId = screenId
        self.configurationBuilder = configurationBuilder
    }

    func download(completion: @escaping (Result<AUIConfiguration, Error>) -> Void) {
        let configuration = configurationBuilder.configuration
        //completion(.success(configuration))
        completion(.failure(MockError()))
        log()
    }

    private func log() {
        guard let data = try? JSONEncoder().encode(configurationBuilder.configuration),
              let string = String(data: data, encoding: .utf8)
        else { return }

        //print("--------------Configuration-Start--------------")
        //print(string)
        //print("--------------Configuration-End--------------")
    }
}
