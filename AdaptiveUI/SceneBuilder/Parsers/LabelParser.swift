//
//  LabelParser.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 06.11.2022.
//

import UIKit

enum LabelParser {
    static func configure(configuration: AUILabel) -> UILabel {
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

        BaseViewConfigurator.configure(view: label, configuration: configuration)
        label.backgroundColor = .clear

        return label
    }
}
