//
//  DataProcessor.swift
//  AdaptiveUI-Example
//
//  Created by Nikita Sosyuk on 27.05.2023.
//

import Foundation
import AdaptiveUI

final class DataProcessor: AUIViewConfigurationProcessorProtocol {
    
    enum DataProcessorError: Error {
        case error
    }
    
    let url: URL
    let screenId: String
    
    init(screenId: String, url: URL) {
        self.screenId = screenId
        self.url = url
    }
    
    func download(completion: @escaping (Result<AdaptiveUI.AUIConfiguration, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let configuration = try? JSONDecoder().decode(AUIConfiguration.self, from: data) {
                return completion(.success(configuration))
            }
            completion(.failure(DataProcessorError.error))
        }.resume()
    }
}
