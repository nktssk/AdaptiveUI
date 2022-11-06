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
        BaseViewConfigurator.configure(view: label, configuration: configuration)

        label.font = configuration.text.uiFont
        label.text = configuration.text.content
        label.numberOfLines = configuration.maxNumberOfLines
        label.shadowOffset = configuration.shadowOffset.cgSize
        label.textAlignment = configuration.alignment.uiAligment
        label.shadowColor = UIColor(from: configuration.shadowColor)

        return label
    }
}
