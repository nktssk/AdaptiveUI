//
//  SceneBuilder.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 06.11.2022.
//

import UIKit

enum SceneBuilder {
    static func parse(configuration: AUIConfiguration) {

    }

    static func buildViewHierarchy(rootView: UIView, configuration: ViewConfiguration) {
        let view: UIView
        switch configuration {
        case .view(let configuration):
            view = UIView()
            BaseViewConfigurator.configure(view: view, configuration: configuration)

        case .label(let configuration):
            view = LabelParser.configure(configuration: configuration)

        case .slider(let configuration):
            view = SliderParser.configure(configuration: configuration)

        case .button(let configuration):
            view = ButtonParser.configure(configuration: configuration)

        case .webView(let configuration):
            view = UIView()

        case .switch(let configuration):
            view = SwitchParser.configure(configuration: configuration)

        case .textView(let configuration):
            view = TextViewParser.configure(configuration: configuration)

        case .imageView(let configuration):
            view = ImageViewParser.configure(configuration: configuration)

        case .textField(let configuration):
            view = TextFieldParser.configure(configuration: configuration)

        case .searchBar(let configuration):
            view = UIView()

        case .pickerView(let configuration):
            view = UIView()

        case .progressView(let configuration):
            view = UIView()

        case .segmentedControl(let configuration):
            view = UIView()

        case .activityIndicator(let configuration):
            view = UIView()
        }

        rootView.addSubview(view)
        for subview in configuration.viewConfiguration.subviews {
            SceneBuilder.buildViewHierarchy(rootView: view, configuration: subview)
        }
    }
}
