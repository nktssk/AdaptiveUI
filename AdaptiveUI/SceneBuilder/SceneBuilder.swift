//
//  SceneBuilder.swift
//  AdaptiveUI
//
//  Created by n.sosyuk on 06.11.2022.
//

import UIKit

typealias ViewHierarchy = [String: UIView]

enum SceneBuilder {
    static func parse(configuration: AUIConfiguration) -> UIViewController {

        let viewController = buildViewController(configuration: configuration.controller)
        let rootView = viewController.view!

        // Build hierarchy

        var hierarchy = [String: UIView]()
        configuration.views.forEach { buildViewHierarchy(rootView: rootView, configuration: $0, hierarchy: &hierarchy) }
        
        // Layout

        AUILayoutManager.layout(hierarchy: hierarchy, constraints: configuration.layout)

        return viewController
    }

    static func buildViewController(configuration: AUIController) -> UIViewController {
        let viewController: UIViewController
        switch configuration.kind {
        case .static:
            viewController = UIViewController()
        case .scrollable:
            viewController = ScrollableViewController()
        case .webView:
            viewController = WebViewControllerViewController(url: configuration.webViewURL)
        }
        viewController.view.backgroundColor = UIColor(from: configuration.backgroundColor)
        return viewController
    }

    static func buildViewHierarchy(rootView: UIView, configuration: ViewConfiguration, hierarchy: inout ViewHierarchy) {
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

        let viewConfiguration = configuration.viewConfiguration
        rootView.addSubview(view)
        hierarchy[viewConfiguration.identifier] = view

        for subview in configuration.viewConfiguration.subviews {
            SceneBuilder.buildViewHierarchy(rootView: view, configuration: subview, hierarchy: &hierarchy)
        }
    }
}
