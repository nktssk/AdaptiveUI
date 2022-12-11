//
//  ProgressViewParser.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 13.11.2022.
//

import UIKit

enum ProgressViewParser {
    static func configure(configuration: AUIProgressView, viewController: AUIViewController) -> UIProgressView {
        let progressView = UIProgressView()
        progressView.progress = configuration.progress
        progressView.trackTintColor = UIColor(from: configuration.trackTintColor)
        progressView.progressTintColor = UIColor(from: configuration.trackTintColor)

        if viewController.viewHierarchy[configuration.identifier] == nil {
            viewController.viewHierarchy[configuration.identifier] = .progressView(progressView)
        }

        BaseViewConfigurator.configure(view: progressView, configuration: configuration, viewController: viewController)

        return progressView
    }
}

