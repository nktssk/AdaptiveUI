//
//  ViewConfiguration.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 05.11.2022.
//

import Foundation

public enum ViewConfiguration: Codable {
    case view(configuration: AUIView)
    case label(configuration: AUILabel)
    case slider(configuration: AUISlider)
    case button(configuration: AUIButton)
    case `switch`(configuration: AUISwitch)
    case textView(configuration: AUITextView)
    case imageView(configuration: AUIImageView)
    case textField(configuration: AUITextField)
    case tableView(configuration: AUITableView)
    case searchBar(configuration: AUISearchBar)
    case pickerView(configuration: AUIPickerView)
    case progressView(configuration: AUIProgressView)
    case collectionView(configuration: AUICollectionView)
    case segmentedControl(configuration: AUISegmentedControl)
    case activityIndicator(configuration: AUIActivityIndicator)
    
    var id: Int {
        switch self {
        case .view(let configuration):
            return  1
        case .label(let configuration):
            return 2
        case .slider(let configuration):
            return  3
        case .button(let configuration):
            return 4
        case .switch(let configuration):
            return 5
        case .textView(let configuration):
            return 6
        case .imageView(let configuration):
            return 7
        case .textField(let configuration):
            return 8
        case .tableView(let configuration):
            return 9
        case .searchBar(let configuration):
            return 10
        case .pickerView(let configuration):
            return 11
        case .progressView(let configuration):
            return 12
        case .collectionView(let configuration):
            return 13
        case .segmentedControl(let configuration):
            return 14
        case .activityIndicator(let configuration):
            return 15
        }
    }
}
