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
        BaseViewConfigurator.configure(view: uiSwitch, configuration: configuration)

        uiSwitch.isOn = configuration.isOn
        if let onTintColor = UIColor(from: configuration.onTintColor) {
            uiSwitch.onTintColor = onTintColor
        }
        if let thumbTintColor = UIColor(from: configuration.thumbTintColor) {
            uiSwitch.thumbTintColor = thumbTintColor
        }
        
        return uiSwitch
    }
}
