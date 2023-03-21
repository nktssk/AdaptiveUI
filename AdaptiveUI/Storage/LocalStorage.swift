//
//  LocalStorage.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 27.02.2023.
//

import Foundation

public final class LocalStorage: LocalStorageProtocol {

    private let fileManager = FileManager.default

    private lazy var fileEncoder = FileEncoder()
    private lazy var fileDecoder = FileDecoder()
    
    private let fileManagerQueue = DispatchQueue(label: "ru.itis.fileManager.queue")

    private var url: URL? {
        fileManager.urls(for: .cachesDirectory, in: .userDomainMask).first
    }
    
    public init() {}

    public func saveData(_ configuration: AUIConfiguration, named: String) {
        fileManagerQueue.async { [weak self] in
            guard let self, let url = self.url else { return }
            
            let fileManager = self.fileManager
            let fileURL = url.appendingPathComponent(named)
            let filePath = fileURL.path
            
            guard let content = try? self.fileEncoder.encode(configuration) else { return }
    
            if fileManager.fileExists(atPath: filePath) {
                try? fileManager.removeItem(at: fileURL)
            }
            fileManager.createFile(atPath: filePath, contents: content)
        }
    }

    public func loadData(named: String, completion: @escaping ResultClosure<AUIConfiguration?>)  {
        fileManagerQueue.async { [weak self] in
            guard let self, let url = self.url else { return completion(nil) }
            
            let fileManager = self.fileManager
            let fileURL = url.appendingPathComponent(named)
            let filePath = fileURL.path
            
            guard fileManager.isReadableFile(atPath: filePath),
                  let fileContents = fileManager.contents(atPath: filePath)
            else { return completion(nil) }

            let result = try? self.fileDecoder.decode(AUIConfiguration.self, from: fileContents)
            return completion(result)
        }
    }
}
