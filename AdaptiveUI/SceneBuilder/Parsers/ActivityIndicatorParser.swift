//
//  ActivityIndicatorParser.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 13.11.2022.
//

import UIKit

enum ActivityIndicatorParser {
    static func configure(configuration: AUIActivityIndicator) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: configuration.isLarge ? .large : .medium)
        activityIndicator.color = UIColor(from: configuration.color)
        if configuration.isAnimating {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }

        BaseViewConfigurator.configure(view: activityIndicator, configuration: configuration)

        return activityIndicator
    }
}
