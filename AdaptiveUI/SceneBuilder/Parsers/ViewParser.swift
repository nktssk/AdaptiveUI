//
//  ViewParser.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 06.11.2022.
//

import UIKit

enum BaseViewConfigurator {
    static func configure(view: UIView, configuration: AUIView) {
        view.alpha = configuration.alpha
        view.isHidden = configuration.isHidden
        view.layer.cornerRadius = configuration.cornerRadius
        view.backgroundColor = UIColor(from: configuration.backgroundColor)
        view.accessibilityIdentifier = configuration.accessibilityIdentifier
    }
}
