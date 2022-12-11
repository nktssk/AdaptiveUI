//
//  AUIActionWrapper.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 11.12.2022.
//

import Foundation

final class AUIActionWrapper: NSObject {

    private let _action: () -> ()

    init(action: @escaping () -> ()) {
        _action = action
        super.init()
    }

    @objc func action() {
        _action()
    }
}
