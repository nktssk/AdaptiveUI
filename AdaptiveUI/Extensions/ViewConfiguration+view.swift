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
        case .collectionView(let configuration):
            return configuration
        }
    }

    mutating func setupActionID(_ actionID: String) {
        switch self {
        case .view(let configuration):
            let config = configuration
            config.actionHandler = [.custom(id: actionID)]
            self = .view(configuration: config)
        case .label(let configuration):
            let config = configuration
            config.actionHandler = [.custom(id: actionID)]
            self = .label(configuration: config)
        case .slider(let configuration):
            let config = configuration
            config.actionHandler = [.custom(id: actionID)]
            self = .slider(configuration: config)
        case .button(let configuration):
            let config = configuration
            config.actionHandler = [.custom(id: actionID)]
            self = .button(configuration: config)
        case .switch(let configuration):
            let config = configuration
            config.actionHandler = [.custom(id: actionID)]
            self = .switch(configuration: config)
        case .textView(let configuration):
            let config = configuration
            config.actionHandler = [.custom(id: actionID)]
            self = .textView(configuration: config)
        case .imageView(let configuration):
            let config = configuration
            config.actionHandler = [.custom(id: actionID)]
            self = .imageView(configuration: config)
        case .tableView(let configuration):
            let config = configuration
            config.actionHandler = [.custom(id: actionID)]
            self = .tableView(configuration: config)
        case .textField(let configuration):
            let config = configuration
            config.actionHandler = [.custom(id: actionID)]
            self = .textField(configuration: config)
        case .searchBar(let configuration):
            let config = configuration
            config.actionHandler = [.custom(id: actionID)]
            self = .searchBar(configuration: config)
        case .pickerView(let configuration):
            let config = configuration
            config.actionHandler = [.custom(id: actionID)]
            self = .pickerView(configuration: config)
        case .progressView(let configuration):
            let config = configuration
            config.actionHandler = [.custom(id: actionID)]
            self = .progressView(configuration: config)
        case .segmentedControl(let configuration):
            let config = configuration
            config.actionHandler = [.custom(id: actionID)]
            self = .segmentedControl(configuration: config)
        case .activityIndicator(let configuration):
            let config = configuration
            config.actionHandler = [.custom(id: actionID)]
            self = .activityIndicator(configuration: config)
        case .collectionView(let configuration):
            let config = configuration
            config.actionHandler = [.custom(id: actionID)]
            self = .collectionView(configuration: config)
        }
    }

    mutating func removeActionID() {
        switch self {
        case .view(let configuration):
            let config = configuration
            
            self = .view(configuration: config)
        case .label(let configuration):
            let config = configuration
            
            self = .label(configuration: config)
        case .slider(let configuration):
            let config = configuration
            
            self = .slider(configuration: config)
        case .button(let configuration):
            let config = configuration
            
            self = .button(configuration: config)
        case .switch(let configuration):
            let config = configuration
            
            self = .switch(configuration: config)
        case .textView(let configuration):
            let config = configuration
            
            self = .textView(configuration: config)
        case .imageView(let configuration):
            let config = configuration
            
            self = .imageView(configuration: config)
        case .tableView(let configuration):
            let config = configuration
            
            self = .tableView(configuration: config)
        case .textField(let configuration):
            let config = configuration
            
            self = .textField(configuration: config)
        case .searchBar(let configuration):
            let config = configuration
            
            self = .searchBar(configuration: config)
        case .pickerView(let configuration):
            let config = configuration
            
            self = .pickerView(configuration: config)
        case .progressView(let configuration):
            let config = configuration
            
            self = .progressView(configuration: config)
        case .segmentedControl(let configuration):
            let config = configuration
            
            self = .segmentedControl(configuration: config)
        case .activityIndicator(let configuration):
            let config = configuration
            
            self = .activityIndicator(configuration: config)
        case .collectionView(let configuration):
            let config = configuration
            
            self = .collectionView(configuration: config)
        }
    }
}
