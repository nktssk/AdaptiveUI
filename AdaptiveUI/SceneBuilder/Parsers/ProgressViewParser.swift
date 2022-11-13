//
//  ProgressViewParser.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 13.11.2022.
//

import UIKit

enum ProgressViewParser {
    static func configure(configuration: AUIProgressView) -> UIProgressView {
        let progressView = UIProgressView()
        progressView.progress = configuration.progress
        progressView.trackTintColor = UIColor(from: configuration.trackTintColor)
        progressView.progressTintColor = UIColor(from: configuration.trackTintColor)

        BaseViewConfigurator.configure(view: progressView, configuration: configuration)

        return progressView
    }
}

