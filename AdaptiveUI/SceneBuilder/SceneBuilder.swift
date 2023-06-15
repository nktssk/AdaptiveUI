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
            
        case .collectionView(let configuration):
            view = CollectionViewParser.configure(configuration: configuration, viewController: viewController)
        }

        let viewConfiguration = configuration.viewConfiguration
        view.tag = configuration.id
        rootView.addSubview(view)
        hierarchy[viewConfiguration.identifier] = view

        for subview in configuration.viewConfiguration.subviews {
            SceneBuilder.buildViewHierarchy(rootView: view, configuration: subview, hierarchy: &hierarchy, viewController: viewController)
        }
    }

    static func buildCell(
        data: CellData,
        cellConfiguration: AUIViewCell,
        viewController: AUIViewController
    ) -> UITableViewCell {
        let cell = UITableViewCell()
        var hierarchy = [String: UIView]()

        data.identifierToData.forEach { key, value in
            guard let actionId = value.actionId,
                  let index = cellConfiguration.subviews.firstIndex(where: { $0.viewConfiguration.identifier == key })
            else { return }
            cellConfiguration.subviews[index].setupActionID(actionId)
        }

        BaseViewConfigurator.configure(view: cell, configuration: cellConfiguration, viewController: viewController)

        cellConfiguration.subviews.forEach {
            SceneBuilder.buildViewHierarchy(rootView: cell.contentView, configuration: $0, hierarchy: &hierarchy, viewController: viewController)
        }

        AUILayoutManager.layout(hierarchy: hierarchy, constraints: cellConfiguration.layout)

        for (identifier, data) in data.identifierToData {
            guard let contentView = hierarchy[identifier] else { continue }
            switch data {
            case .image(let imageURL, let imageName, _):
                if let imageURL {
                    (contentView as? AsyncUIImageView)?.url = imageURL
                } else {
                    (contentView as? AsyncUIImageView)?.image = UIImage(named: imageName!)
                }
            case .text(let text, _):
                (contentView as? UILabel)?.text = text
            case .button(content: let content, _):
                (contentView as? UIButton)?.setTitle(content, for: .normal)
            case .switch(isOn: let isOn, _):
                (contentView as? UISwitch)?.isOn = isOn
            case .backgroundColor(let string):
                contentView.backgroundColor = UIColor(hex: string)
            }
        }

        data.identifierToData.forEach { key, value in
            guard let actionId = value.actionId,
                  let index = cellConfiguration.subviews.firstIndex(where: { $0.viewConfiguration.identifier == key }),
                  cellConfiguration.subviews[index].viewConfiguration.actionHandler.contains(where: { $0 == .custom(id: actionId) })
            else { return }
            cellConfiguration.subviews[index].removeActionID()
        }

        return cell
    }
    
    static func buildCell(
        data: CellData,
        cell: StubCell,
        config: AUICollectionView.Layout,
        cellConfiguration: AUIViewCell,
        viewController: AUIViewController
    ) -> UICollectionViewCell {
        
        var hierarchy = [String: UIView]()
        cell.contentView.subviews.reuse()

        data.identifierToData.forEach { key, value in
            guard let actionId = value.actionId,
                  let index = cellConfiguration.subviews.firstIndex(where: { $0.viewConfiguration.identifier == key })
            else { return }
            cellConfiguration.subviews[index].setupActionID(actionId)
        }

        BaseViewConfigurator.configure(view: cell.contentView, configuration: cellConfiguration, viewController: viewController)

        cellConfiguration.subviews.forEach {
            SceneBuilder.buildViewHierarchy(rootView: cell.contentView, configuration: $0, hierarchy: &hierarchy, viewController: viewController)
        }

        AUILayoutManager.layout(hierarchy: hierarchy, constraints: cellConfiguration.layout)

        if case let .backgroundColor(string) = data.identifierToData["backgroundColor"] {
            cell.contentView.backgroundColor = UIColor(hex: string)
            cell.backgroundView?.backgroundColor = UIColor(hex: string)
        }
        
        for (identifier, data) in data.identifierToData {
            guard let contentView = hierarchy[identifier] else { continue }
            switch data {
            case .image(let imageURL, let imageName, _):
                if let imageURL {
                    (contentView as? AsyncUIImageView)?.url = imageURL
                } else {
                    (contentView as? AsyncUIImageView)?.image = UIImage(named: imageName!)
                }
            case .text(let text, _):
                (contentView as? UILabel)?.text = text
            case .button(content: let content, _):
                (contentView as? UIButton)?.setTitle(content, for: .normal)
            case .backgroundColor(_): break
            case .switch(isOn: let isOn, _):
                (contentView as? UISwitch)?.isOn = isOn
            }
        }

        data.identifierToData.forEach { key, value in
            guard let actionId = value.actionId,
                  let index = cellConfiguration.subviews.firstIndex(where: {
                      $0.viewConfiguration.identifier == key
                  }),
                  cellConfiguration.subviews[index].viewConfiguration.actionHandler.contains(where: { $0 == .custom(id: actionId) })
            else { return }
            cellConfiguration.subviews[index].removeActionID()
        }

        return cell
    }
}
