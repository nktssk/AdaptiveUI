//
//  MockAUIViewConfigurationProcessor.swift
//  AdaptiveUI-Example
//
//  Created by n.sosyuk on 07.12.2022.
//

import Foundation
import AdaptiveUI

class MockAUIViewConfigurationProcessor: AUIViewConfigurationProcessorProtocol {
    func download(completion: @escaping (Result<AUIConfiguration, Error>) -> Void) {
        let configuration = ConfigurationBuilder.configuration
        completion(.success(configuration))
    }
}
