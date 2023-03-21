//
//  LocalStorage.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 27.02.2023.
//

import Foundation

typealias FileEncoder = JSONEncoder
typealias FileDecoder = JSONDecoder

public protocol LocalStorageProtocol {
    func saveData(_ configuration: AUIConfiguration, named: String)
    func loadData(named: String, completion: @escaping ResultClosure<AUIConfiguration?>)
}
