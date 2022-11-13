//
//  PickerViewParser.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 13.11.2022.
//

import UIKit

enum PickerViewParser {
    static func configure(configuration: AUIPickerView) -> UIPickerView {
        let pickerView = UIPickerView()
        // TODO: - Delegate

        BaseViewConfigurator.configure(view: pickerView, configuration: configuration)

        return pickerView
    }
}

