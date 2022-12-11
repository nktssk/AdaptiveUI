//
//  SwitchParser.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 07.11.2022.
//

import UIKit

enum SwitchParser {
    static func configure(configuration: AUISwitch, viewController: AUIViewController) -> UISwitch {
        let uiSwitch = UISwitch()
        uiSwitch.isOn = configuration.isOn
        if let onTintColor = UIColor(from: configuration.onTintColor) {
            uiSwitch.onTintColor = onTintColor
        }
        if let thumbTintColor = UIColor(from: configuration.thumbTintColor) {
            uiSwitch.thumbTintColor = thumbTintColor
        }
        let actionWrapper = AUIActionWrapper { [weak viewController, unowned uiSwitch] in
            viewController?.switchValueDidChange(uiSwitch)
        }
        viewController.actionWrappers.append(actionWrapper)
        uiSwitch.addTarget(actionWrapper, action: #selector(actionWrapper.action), for: .valueChanged)

        if viewController.viewHierarchy[configuration.identifier] == nil {
            viewController.viewHierarchy[configuration.identifier] = .`switch`(uiSwitch)
        }

        BaseViewConfigurator.configure(view: uiSwitch, configuration: configuration, viewController: viewController)

        return uiSwitch
    }
}
