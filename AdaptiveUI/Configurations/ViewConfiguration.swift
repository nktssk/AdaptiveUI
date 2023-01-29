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
    case segmentedControl(configuration: AUISegmentedControl)
    case activityIndicator(configuration: AUIActivityIndicator)
}
