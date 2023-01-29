//
//  SceneBuilder.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 06.11.2022.
//

import UIKit

typealias ViewHierarchy = [String: UIView]

enum SceneBuilder {
    static func parse(configuration: AUIConfiguration, rootView: UIView, viewController: AUIViewController) {

        // Build hierarchy

        var hierarchy = [String: UIView]()
        configuration.views.forEach { configuration in
            DispatchQueue.main.async {
                buildViewHierarchy(
                    rootView: rootView,
                    configuration: configuration,
                    hierarchy: &hierarchy,
                    viewController: viewController
                )
            }
        }
        
        // Layout

        DispatchQueue.main.async {
            AUILayoutManager.layout(hierarchy: hierarchy, constraints: configuration.layout)
        }
    }

    static func buildViewHierarchy(rootView: UIView, configuration: ViewConfiguration, hierarchy: inout ViewHierarchy, viewController: AUIViewController) {
        let view: UIView
        switch configuration {
        case .view(let configuration):
            view = UIView()
            BaseViewConfigurator.configure(view: view, configuration: configuration, viewController: viewController)

        case .label(let configuration):
            view = LabelParser.configure(configuration: configuration, viewController: viewController)

        case .slider(let configuration):
            view = SliderParser.configure(configuration: configuration, viewController: viewController)

        case .button(let configuration):
            view = ButtonParser.configure(configuration: configuration, viewController: viewController)

        case .switch(let configuration):
            view = SwitchParser.configure(configuration: configuration, viewController: viewController)

        case .textView(let configuration):
            view = TextViewParser.configure(configuration: configuration, viewController: viewController)

        case .imageView(let configuration):
            view = ImageViewParser.configure(configuration: configuration, viewController: viewController)

        case .textField(let configuration):
            view = TextFieldParser.configure(configuration: configuration, viewController: viewController)

        case .searchBar(let configuration):
            view = SearchBarParser.configure(configuration: configuration, viewController: viewController)

        case .pickerView(let configuration):
            view = PickerViewParser.configure(configuration: configuration, viewController: viewController)

        case .progressView(let configuration):
            view = ProgressViewParser.configure(configuration: configuration, viewController: viewController)

        case .segmentedControl(let configuration):
            view = SegmentedControlParser.configure(configuration: configuration, viewController: viewController)

        case .activityIndicator(let configuration):
            view = ActivityIndicatorParser.configure(configuration: configuration, viewController: viewController)

        case .tableView(let configuration):
            view = TableViewParser.configure(configuration: configuration, viewController: viewController)
        }

        let viewConfiguration = configuration.viewConfiguration
        rootView.addSubview(view)
        hierarchy[viewConfiguration.identifier] = view

        for subview in configuration.viewConfiguration.subviews {
            SceneBuilder.buildViewHierarchy(rootView: view, configuration: subview, hierarchy: &hierarchy, viewController: viewController)
        }
    }
}
