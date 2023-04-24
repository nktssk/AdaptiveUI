//
//  AUIViewEnumeration.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 11.12.2022.
//

import UIKit

public enum AUIViewEnumeration {
    case view(UIView)
    case label(UILabel)
    case slider(UISlider)
    case button(UIButton)
    case `switch`(UISwitch)
    case textView(UITextView)
    case textField(UITextField)
    case imageView(UIImageView)
    case searchBar(UISearchBar)
    case pickerView(UIPickerView)
    case progressView(UIProgressView)
    case segmentedControl(UISegmentedControl)
    case activityIndicator(UIActivityIndicatorView)
    case tableView(UITableView)
    case collectionView(UICollectionView)
    
    var view: UIView {
        switch self {
        case .view(let view):
            return view
        case .label(let view):
            return view
        case .slider(let view):
            return view
        case .button(let view):
            return view
        case .switch(let view):
            return view
        case .textView(let view):
            return view
        case .textField(let view):
            return view
        case .imageView(let view):
            return view
        case .searchBar(let view):
            return view
        case .pickerView(let view):
            return view
        case .progressView(let view):
            return view
        case .segmentedControl(let view):
            return view
        case .activityIndicator(let view):
            return view
        case .tableView(let view):
            return view
        case .collectionView(let view):
            return view
        }
    }
}
