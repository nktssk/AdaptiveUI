//
//  ActivityIndicatorParser.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 13.11.2022.
//

import UIKit

enum ActivityIndicatorParser {
    static func configure(configuration: AUIActivityIndicator, viewController: AUIViewController) -> UIActivityIndicatorView {
        let activityIndicator: UIActivityIndicatorView
        if #available(iOS 13.0, *) {
            activityIndicator = UIActivityIndicatorView(style: configuration.isLarge ? .large : .medium)
        } else {
            activityIndicator = UIActivityIndicatorView()
        }
        activityIndicator.color = UIColor(from: configuration.color)
        if configuration.isAnimating {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }

        if viewController.viewHierarchy[configuration.identifier] == nil {
            viewController.viewHierarchy[configuration.identifier] = .activityIndicator(activityIndicator)
        }

        BaseViewConfigurator.configure(view: activityIndicator, configuration: configuration, viewController: viewController)

        return activityIndicator
    }
}
