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
            view = SearchBarParser.configure(configuration: configuration)

        case .pickerView(let configuration):
            view = PickerViewParser.configure(configuration: configuration)

        case .progressView(let configuration):
            view = ProgressViewParser.configure(configuration: configuration)

        case .segmentedControl(let configuration):
            view = SegmentedControlParser.configure(configuration: configuration)

        case .activityIndicator(let configuration):
            view = ActivityIndicatorParser.configure(configuration: configuration)
        }

        rootView.addSubview(view)
        for subview in configuration.viewConfiguration.subviews {
            SceneBuilder.buildViewHierarchy(rootView: view, configuration: subview)
        }
    }
}
