//
//  LocalStorage.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 27.02.2023.
//

import Foundation

typealias FileEncoder = JSONEncoder
typealias FileDecoder = JSONDecoder

protocol LocalStorageProtocol {
    func loadData(named: String) throws -> AUIConfiguration
    func saveData(_ configuration: AUIConfiguration, named: String) throws
}
