//
//  FPSServiceProtocol.swift
//  Benchmark
//
//  Created by Nikita Sosyuk on 7.12.22.
//

import Foundation

protocol FPSServiceProtocol: AnyObject {
    /// negative value of fpsValue means, data is not available at this moment
    var fpsValue: ObservableValue<Int> { get }
    func startMonitoring()
    func stopMonitoring()
}
