//
//  ScreenMeasure.swift
//  AdaptiveUI-Example
//
//  Created by Nikita Sosyuk on 03.04.2023.
//

import Foundation
import QuartzCore
import UIKit

public final class ScreenMeasure {
    
    public var data: [String] = []
    
    let monitoringService = MonitoringService(
        fpsService: FPSService(),
        cpuService: CPUService(),
        ramService: RAMService()
    )
    
    var isRecording = false
    var startTime: CFTimeInterval = 0.0
    
    func start() {
        monitoringService.startMonitoring()
        startTime = CACurrentMediaTime()
        isRecording = true
    }
    
    func stop() {
        guard isRecording else { return }
        
        let timeInterval = CACurrentMediaTime() - startTime
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            // self.data.append(String(self.monitoringService.stopMonitoring()))
        }
        data.append(String("Время открытия экрана: \(timeInterval * 1000) миллисекунд"))
        isRecording = false
    }
}

extension UIViewController {

    static func swizzle() {
        let originalSelector = #selector(viewDidLayoutSubviews)
        let swizzledSelector = #selector(dc_viewDidLayoutSubviews)
        
        guard
            let originalMethod = class_getInstanceMethod(self, originalSelector),
            let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)
            else { return }
        
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }

    // MARK: - Method Swizzling

    @objc func dc_viewDidLayoutSubviews(animated: Bool) {
        self.dc_viewDidLayoutSubviews(animated: animated)
        
        measureGlobal.stop()
    }
}
