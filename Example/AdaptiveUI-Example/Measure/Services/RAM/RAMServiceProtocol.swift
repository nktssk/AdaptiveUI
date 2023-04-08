//
//  RAMServiceProtocol.swift
//  Benchmark
//
//  Created by Nikita Sosyuk on 11.12.22.
//

import Foundation

public struct RAMInfo: Codable {
    let currentBytes: Int64
    let peakBytes: Int64

    static let zero: RAMInfo = .init(currentBytes: 0, peakBytes: 0)
}

protocol RAMServiceProtocol: AnyObject {
    var ramInfo: RAMInfo { get }
}
