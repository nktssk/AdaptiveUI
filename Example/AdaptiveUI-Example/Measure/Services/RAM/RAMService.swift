//
//  RAMService.swift
//  Benchmark
//
//  Created by Nikita Sosyuk on 11.12.22.
//

import Foundation

final class RAMService: RAMServiceProtocol {

    private var info: RAMInfo = .zero

    var ramInfo: RAMInfo {
        if let current = memoryFootprint() {
            info = RAMInfo(
                currentBytes: current,
                peakBytes: max(current, info.peakBytes)
            )
        }
        return info
    }

    // From Quinn the Eskimo at Apple.
    // https://forums.developer.apple.com/thread/105088#357415

    private func memoryFootprint() -> Int64? {
        // The `TASK_VM_INFO_COUNT` and `TASK_VM_INFO_REV1_COUNT` macros are too
        // complex for the Swift C importer, so we have to define them ourselves.
        let TASK_VM_INFO_COUNT = mach_msg_type_number_t(MemoryLayout<task_vm_info_data_t>.size / MemoryLayout<integer_t>.size)
        let TASK_VM_INFO_REV1_COUNT = mach_msg_type_number_t(MemoryLayout.offset(of: \task_vm_info_data_t.min_address)! / MemoryLayout<integer_t>.size)
        var info = task_vm_info_data_t()
        var count = TASK_VM_INFO_COUNT
        let kr = withUnsafeMutablePointer(to: &info) { infoPtr in
            infoPtr.withMemoryRebound(to: integer_t.self, capacity: Int(count)) { intPtr in
                task_info(mach_task_self_, task_flavor_t(TASK_VM_INFO), intPtr, &count)
            }
        }
        guard
            kr == KERN_SUCCESS,
            count >= TASK_VM_INFO_REV1_COUNT
        else {
            return nil
        }

        let usedBytes = Int64(info.phys_footprint)
        return usedBytes
    }
}
