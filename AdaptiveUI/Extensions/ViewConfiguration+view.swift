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
        case .tableView(let configuration):
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

    mutating func setupActionID(_ actionID: String) {
        switch self {
        case .view(let configuration):
            let config = configuration
            config.actionHandler = .custom(id: actionID)
            self = .view(configuration: config)
        case .label(let configuration):
            let config = configuration
            config.actionHandler = .custom(id: actionID)
            self = .label(configuration: config)
        case .slider(let configuration):
            let config = configuration
            config.actionHandler = .custom(id: actionID)
            self = .slider(configuration: config)
        case .button(let configuration):
            let config = configuration
            config.actionHandler = .custom(id: actionID)
            self = .button(configuration: config)
        case .switch(let configuration):
            let config = configuration
            config.actionHandler = .custom(id: actionID)
            self = .switch(configuration: config)
        case .textView(let configuration):
            let config = configuration
            config.actionHandler = .custom(id: actionID)
            self = .textView(configuration: config)
        case .imageView(let configuration):
            let config = configuration
            config.actionHandler = .custom(id: actionID)
            self = .imageView(configuration: config)
        case .tableView(let configuration):
            let config = configuration
            config.actionHandler = .custom(id: actionID)
            self = .tableView(configuration: config)
        case .textField(let configuration):
            let config = configuration
            config.actionHandler = .custom(id: actionID)
            self = .textField(configuration: config)
        case .searchBar(let configuration):
            let config = configuration
            config.actionHandler = .custom(id: actionID)
            self = .searchBar(configuration: config)
        case .pickerView(let configuration):
            let config = configuration
            config.actionHandler = .custom(id: actionID)
            self = .pickerView(configuration: config)
        case .progressView(let configuration):
            let config = configuration
            config.actionHandler = .custom(id: actionID)
            self = .progressView(configuration: config)
        case .segmentedControl(let configuration):
            let config = configuration
            config.actionHandler = .custom(id: actionID)
            self = .segmentedControl(configuration: config)
        case .activityIndicator(let configuration):
            let config = configuration
            config.actionHandler = .custom(id: actionID)
            self = .activityIndicator(configuration: config)
        }
    }

    mutating func removeActionID() {
        switch self {
        case .view(let configuration):
            let config = configuration
            config.actionHandler = nil
            self = .view(configuration: config)
        case .label(let configuration):
            let config = configuration
            config.actionHandler = nil
            self = .label(configuration: config)
        case .slider(let configuration):
            let config = configuration
            config.actionHandler = nil
            self = .slider(configuration: config)
        case .button(let configuration):
            let config = configuration
            config.actionHandler = nil
            self = .button(configuration: config)
        case .switch(let configuration):
            let config = configuration
            config.actionHandler = nil
            self = .switch(configuration: config)
        case .textView(let configuration):
            let config = configuration
            config.actionHandler = nil
            self = .textView(configuration: config)
        case .imageView(let configuration):
            let config = configuration
            config.actionHandler = nil
            self = .imageView(configuration: config)
        case .tableView(let configuration):
            let config = configuration
            config.actionHandler = nil
            self = .tableView(configuration: config)
        case .textField(let configuration):
            let config = configuration
            config.actionHandler = nil
            self = .textField(configuration: config)
        case .searchBar(let configuration):
            let config = configuration
            config.actionHandler = nil
            self = .searchBar(configuration: config)
        case .pickerView(let configuration):
            let config = configuration
            config.actionHandler = nil
            self = .pickerView(configuration: config)
        case .progressView(let configuration):
            let config = configuration
            config.actionHandler = nil
            self = .progressView(configuration: config)
        case .segmentedControl(let configuration):
            let config = configuration
            config.actionHandler = nil
            self = .segmentedControl(configuration: config)
        case .activityIndicator(let configuration):
            let config = configuration
            config.actionHandler = nil
            self = .activityIndicator(configuration: config)
        }
    }
}
