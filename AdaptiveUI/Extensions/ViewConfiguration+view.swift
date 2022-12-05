//
//  ViewConfiguration+view.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 06.11.2022.
//

import Foundation

extension ViewConfiguration {
    var viewConfiguration: AUIView {
        switch self {
        case .view(let configuration):
            return configuration
        case .label(let configuration):
            return configuration
        case .slider(let configuration):
            return configuration
        case .button(let configuration):
            return configuration
        case .switch(let configuration):
            return configuration
        case .textView(let configuration):
            return configuration
        case .imageView(let configuration):
            return configuration
        case .textField(let configuration):
            return configuration
        case .searchBar(let configuration):
            return configuration
        case .pickerView(let configuration):
            return configuration
        case .progressView(let configuration):
            return configuration
        case .segmentedControl(let configuration):
            return configuration
        case .activityIndicator(let configuration):
            return configuration
        }
    }
}
