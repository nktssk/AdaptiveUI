//
//  FPSService.swift
//  Benchmark
//
//  Created by Nikita Sosyuk on 7.12.22.
//

import Foundation
import FPSCounter

final class FPSService: NSObject, FPSServiceProtocol {

    private let fpsCounter: FPSCounter
    private var isMonitoring = false
    var fpsValue: ObservableValue<Int> = .init(0)

    override init() {
        fpsCounter = FPSCounter()
        fpsCounter.notificationDelay = 0.00001
        super.init()
        fpsCounter.delegate = self
    }

    func startMonitoring() {
        if !isMonitoring {
            fpsCounter.startTracking()
            isMonitoring = true
        }
    }

    func stopMonitoring() {
        if isMonitoring {
            fpsCounter.stopTracking()
            isMonitoring = false
        }
    }
}

extension FPSService: FPSCounterDelegate {

    func fpsCounter(_ counter: FPSCounter, didUpdateFramesPerSecond fps: Int) {
        fpsValue.value = fps
    }
}
