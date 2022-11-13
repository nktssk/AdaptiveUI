//
//  TextFieldParser.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 07.11.2022.
//

import UIKit

enum TextFieldParser {
    static func configure(configuration: AUITextField) -> UITextField {
        let textField = UITextField()
        textField.font = configuration.text.uiFont
        textField.text = configuration.text.content
        textField.placeholder = configuration.placeholder
        textField.borderStyle = configuration.borderStyle.uiKit
        textField.keyboardType = configuration.keyboardType.uiKit
        textField.textAlignment = configuration.textAlignment.uiKit
        textField.textColor = UIColor(from: configuration.textColor)
        textField.clearButtonMode = configuration.cleanButtonMode.uiKit
        textField.autocorrectionType = configuration.autocorrectionType.uiKit
        textField.autocapitalizationType = configuration.autocapitalizationType.uiKit
        textField.spellCheckingType = configuration.spellCheckingType.uiKit

        // TODO: - Delegate

        BaseViewConfigurator.configure(view: textField, configuration: configuration)

        return textField
    }
}
