//
//  SwitchParser.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 07.11.2022.
//

import UIKit

enum SwitchParser {
    static func configure(configuration: AUISwitch) -> UISwitch {
        let uiSwitch = UISwitch()
        uiSwitch.isOn = configuration.isOn
        if let onTintColor = UIColor(from: configuration.onTintColor) {
            uiSwitch.onTintColor = onTintColor
        }
        if let thumbTintColor = UIColor(from: configuration.thumbTintColor) {
            uiSwitch.thumbTintColor = thumbTintColor
        }

        BaseViewConfigurator.configure(view: uiSwitch, configuration: configuration)

        return uiSwitch
    }
}
