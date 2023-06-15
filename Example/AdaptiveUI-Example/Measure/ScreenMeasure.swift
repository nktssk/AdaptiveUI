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
    
    public static let shared = ScreenMeasure()
    
    public var data: [CFTimeInterval] = []
    
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
        data.append(timeInterval)
        isRecording = false
        monitoringService.stopRecording()
    }
}

extension UIViewController {

    static func swizzle() {
        let originalSelector = #selector(viewDidDisappear)
        let swizzledSelector = #selector(dc_viewDidLayoutSubviews)
        
        guard
            let originalMethod = class_getInstanceMethod(self, originalSelector),
            let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)
            else { return }
        
        method_exchangeImplementations(originalMethod, swizzledMethod)
        
        let originalSelector2 = #selector(viewWillAppear)
        let swizzledSelector2 = #selector(dc_viewDidSubviews)
        
        guard
            let originalMethod2 = class_getInstanceMethod(self, originalSelector2),
            let swizzledMethod2 = class_getInstanceMethod(self, swizzledSelector2)
            else { return }
        
        method_exchangeImplementations(originalMethod2, swizzledMethod2)
    }

    // MARK: - Method Swizzling

    @objc func dc_viewDidLayoutSubviews(animated: Bool) {
        self.dc_viewDidLayoutSubviews(animated: animated)
        
        measureGlobal.stop()
    }
    
    
    @objc func dc_viewDidSubviews(animated: Bool) {
        self.dc_viewDidSubviews(animated: animated)
        
        measureGlobal.start()
    }
    
}
