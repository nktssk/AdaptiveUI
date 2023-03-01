//
//  LocalStorage.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 27.02.2023.
//

import Foundation

enum LocalStorageError: Error {
    case parsing
    case notFoundFile
    case notFoundBaseURL
}

final class LocalStorage: LocalStorageProtocol {

    private let fileManager = FileManager.default

    private lazy var fileEncoder = FileEncoder()
    private lazy var fileDecoder = FileDecoder()

    private var url: URL? {
        fileManager.urls(for: .cachesDirectory, in: .userDomainMask).first
    }

    func saveData(_ configuration: AUIConfiguration, named: String) throws {
        guard let url = url else { throw LocalStorageError.notFoundBaseURL }

        let fileURL = url.appendingPathComponent("/" + named)
        let filePath = fileURL.path
        let content = try fileEncoder.encode(configuration)

        fileManager.createFile(atPath: filePath, contents: content)
    }

    func loadData(named: String) throws -> AUIConfiguration {
        guard let url = url else { throw LocalStorageError.notFoundBaseURL }

        let fileURL = url.appendingPathComponent("/" + named)
        let filePath = fileURL.path
        guard fileManager.isReadableFile(atPath: filePath),
              let fileContents = fileManager.contents(atPath: filePath)
        else { throw LocalStorageError.notFoundFile }

        let result = try fileDecoder.decode(AUIConfiguration.self, from: fileContents)
        return result
    }
}
