//
//  MonitoringService.swift
//  Benchmark
//
//  Created by Nikita Sosyuk on 8.12.22.
//

import Foundation
import Combine

final class MonitoringService: MonitoringServiceProtocol {
    var recordedValues = [MonitoringData]()
    private var disposeBag = Set<AnyCancellable>()

    private let fpsService: FPSServiceProtocol
    private let cpuService: CPUServiceProtocol
    private let ramService: RAMServiceProtocol

    var isMonitoring: ObservableValue<Bool> = .init(false)
    var isRecording: ObservableValue<Bool> = .init(false)
    var data: ObservableValue<MonitoringData> = .init(.invalid)

    init(fpsService: FPSServiceProtocol,
         cpuService: CPUServiceProtocol,
         ramService: RAMServiceProtocol
    ) {
        self.fpsService = fpsService
        self.cpuService = cpuService
        self.ramService = ramService
        setupObserving()
    }

    private func setupObserving() {
        fpsService.fpsValue.$value
            .receive(on: DispatchQueue.main)
            .sink { [weak self] fps in
                guard let self else { return }
                self.onValues(
                    fps: fps,
                    cpu: self.cpuService.cpuUsage,
                    ramInfo: self.ramService.ramInfo
                )

            }.store(in: &disposeBag)
    }

    private func onValues(fps: Int, cpu: Double, ramInfo: RAMInfo) {
        let next = MonitoringData(fps: fps, cpuUsage: cpu, ramUsage: ramInfo)
        data.value = next
        if isRecording.value {
            recordedValues.append(next)
        }
    }

    func startMonitoring() {
        if !isMonitoring.value {
            startRecoding()
            isMonitoring.value = true
            fpsService.startMonitoring()
        }
    }

    func stopMonitoring() {
        if isMonitoring.value {
            isMonitoring.value = false
            fpsService.stopMonitoring()
            data.value = .invalid
        }
    }

    func startRecoding() {
        if !isRecording.value {
            isRecording.value = true
            recordedValues.removeAll()
        }
    }

    func stopRecording() {
        if isRecording.value {
            isRecording.value = false
        }
    }

    func clearStatistics() {
        recordedValues.removeAll()
    }

    func getStatistics() -> MonitoringStatistics {
        return recordedValues
    }
}
