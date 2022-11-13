//
//  TextViewParser.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 07.11.2022.
//

import UIKit

enum TextViewParser {
    static func configure(configuration: AUITextView) -> UITextView {
        let textView = UITextView()
        textView.font = configuration.text.uiFont
        textView.text = configuration.text.content
        textView.isEditable = configuration.isEditable
        textView.isSelectable = configuration.isSelectable
        textView.textAlignment = configuration.alignment.uiAligment

        BaseViewConfigurator.configure(view: textView, configuration: configuration)

        return textView
    }
}
