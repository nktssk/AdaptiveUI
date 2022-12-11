//
//  PickerViewParser.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 13.11.2022.
//

import UIKit

enum PickerViewParser {
    static func configure(configuration: AUIPickerView, viewController: AUIViewController) -> UIPickerView {
        let pickerView = UIPickerView()

        if viewController.viewHierarchy[configuration.identifier] == nil {
            viewController.viewHierarchy[configuration.identifier] = .pickerView(pickerView)
        }

        BaseViewConfigurator.configure(view: pickerView, configuration: configuration, viewController: viewController)

        return pickerView
    }
}

