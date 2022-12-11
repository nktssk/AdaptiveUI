//
//  AUIViewControllerDelegate.swift
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
    case searchBar(UISearchBar)
    case pickerView(UIPickerView)
    case progressView(UIProgressView)
    case segmentedControl(UISegmentedControl)
    case activityIndicator(UIActivityIndicatorView)
}

public class ActionHandler: Hashable {
    let action: VoidClosure
    private let uuid = UUID()

    init(action: @escaping VoidClosure) {
        self.action = action
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }

    public static func == (lhs: ActionHandler, rhs: ActionHandler) -> Bool {
        lhs.uuid == rhs.uuid
    }
}

public class AUIViewControllerDelegate {
    var actions: [String: ActionHandler] = [:]
    var viewHierarchy: [String: AUIViewEnumeration] = [:]
}
