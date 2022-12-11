//
//  LabelParser.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 06.11.2022.
//

import UIKit

enum LabelParser {
    static func configure(configuration: AUILabel, viewController: AUIViewController) -> UILabel {
        let label = UILabel()
        label.font = configuration.text.uiFont
        label.text = configuration.text.content
        label.numberOfLines = configuration.maxNumberOfLines
        label.textColor = UIColor(from: configuration.textColor)
        label.textAlignment = configuration.alignment.uiAligment
        label.shadowColor = UIColor(from: configuration.shadowColor)

        if let shadowOffset = configuration.shadowOffset?.cgSize {
            label.shadowOffset = shadowOffset
        }

        if viewController.viewHierarchy[configuration.identifier] == nil {
            viewController.viewHierarchy[configuration.identifier] = .label(label)
        }

        BaseViewConfigurator.configure(view: label, configuration: configuration, viewController: viewController)
        label.backgroundColor = .clear

        return label
    }
}
